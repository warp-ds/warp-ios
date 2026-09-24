#!/usr/bin/env python3
"""Regenerate the colour-variant overlay from TokenProvider.swift.

`Warp.ColorVariant.Overrides` and `VariantTokenProvider` both mirror the token protocol
one-for-one, so they are generated rather than hand-maintained. Run this after the tokens
are regenerated from https://github.com/warp-ds/tokens.

    python3 Scripts/generate-color-variant.py
"""

import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
PROTOCOL = ROOT / "Sources/Colors/Tokens/TokenProvider.swift"
OUT_DIR = ROOT / "Sources/Colors/Variants"

HEADER = (
    "// Generated from TokenProvider.swift — do not edit by hand.\n"
    "// Regenerate with Scripts/generate-color-variant.py\n"
)


def token_names() -> list:
    names = re.findall(r"^\s+var (\w+): Color \{ get \}", PROTOCOL.read_text(), re.M)
    if not names:
        sys.exit("no tokens found in %s" % PROTOCOL)
    return names


def write_overrides(tokens: list) -> None:
    body = "\n".join("        public var %s: Color?" % t for t in tokens)
    (OUT_DIR / "ColorVariantOverrides.swift").write_text(
        'import SwiftUI\n\n%s\npublic extension Warp.ColorVariant {\n'
        '    /// A sparse set of token overrides.\n'
        '    ///\n'
        '    /// Every property defaults to `nil`, meaning "use the brand\'s value". A variant\n'
        '    /// names only the tokens it changes; everything else falls through to the brand.\n'
        '    struct Overrides: Sendable {\n'
        '%s\n\n'
        '        init() {}\n'
        '    }\n'
        '}\n' % (HEADER, body)
    )


def write_provider(tokens: list) -> None:
    body = "\n".join(
        "    var %s: Color { overrides.%s ?? base.%s }" % (t, t, t) for t in tokens
    )
    (OUT_DIR / "VariantTokenProvider.swift").write_text(
        'import SwiftUI\n\n%s\n'
        "/// A `TokenProvider` that layers a variant's overrides on top of a brand's tokens.\n"
        '///\n'
        '/// Any token the variant does not name resolves to `base`, so the brand remains the\n'
        '/// source of truth and a variant stays a small, reviewable diff.\n'
        'struct VariantTokenProvider: TokenProvider {\n'
        '    let base: TokenProvider\n'
        '    let overrides: Warp.ColorVariant.Overrides\n\n'
        '%s\n'
        '}\n' % (HEADER, body)
    )


def main() -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    tokens = token_names()
    write_overrides(tokens)
    write_provider(tokens)
    print("generated overlay for %d tokens" % len(tokens))


if __name__ == "__main__":
    main()
