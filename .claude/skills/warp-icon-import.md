---
name: warp-icon-import
description: Import Warp regular icons from warp-ds/elements web repository with translations
---

# Warp Icon Import

Process for importing regular icons from the warp-ds/elements web repository into the Warp iOS library with corresponding accessibility translations.

## Source Repository

Icons are sourced from: https://github.com/warp-ds/elements

Web icon location: `warp-ds/elements/components/icons/src/`

## Import Process

### 1. Download SVG from Web Repository

Icons are stored as SVG files in the web repository. Download the desired icon SVG file.

**Naming convention:**
- Web: kebab-case (e.g., `active-ads.svg`)
- iOS: PascalCase (e.g., `ActiveAds.svg`)

### 2. Create Asset Catalog Image Set

Location: `Sources/Icon/Icons.xcassets/RegularIcons/`

For each icon, create a folder structure:
```
RegularIcons/
  {IconName}.imageset/
    {IconName}.svg
    Contents.json
```

**Contents.json template:**
```json
{
  "images" : [
    {
      "filename" : "{IconName}.svg",
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  },
  "properties" : {
    "preserves-vector-representation" : true,
    "template-rendering-intent" : "template"
  }
}
```

**Key properties:**
- `preserves-vector-representation: true` - Keeps SVG scalable
- `template-rendering-intent: "template"` - Allows tinting

### 3. Add Icon Enum Case

Location: `Sources/Icon/Icon.swift`

Add case to the `Icon` enum:
```swift
public enum Icon: String, CaseIterable {
    // ... existing cases
    case {camelCaseName}  // e.g., case activeAds
}
```

### 4. Add Accessibility Title Mapping

In the same file, add the localized title mapping:
```swift
public var title: String {
    switch self {
    // ... existing mappings
    case .{camelCaseName}: return Warp.Strings.icon{PascalCaseName}.localized
    }
}
```

Example:
```swift
case .activeAds: return Warp.Strings.iconActiveAds.localized
```

### 5. Add Translations

Location: `Sources/Resources/Localizable.xcstrings`

Add translation entry with key format: `icon.title.{camelCaseName}`

**Structure:**
```json
"icon.title.{camelCaseName}" : {
  "comment" : "A11y title for {icon name} icon",
  "extractionState" : "manual",
  "localizations" : {
    "da" : {
      "stringUnit" : {
        "state" : "translated",
        "value" : "Danish translation"
      }
    },
    "en" : {
      "stringUnit" : {
        "state" : "translated",
        "value" : "English translation"
      }
    },
    "fi" : {
      "stringUnit" : {
        "state" : "translated",
        "value" : "Finnish translation"
      }
    },
    "nb-NO" : {
      "stringUnit" : {
        "state" : "translated",
        "value" : "Norwegian translation"
      }
    },
    "sv" : {
      "stringUnit" : {
        "state" : "translated",
        "value" : "Swedish translation"
      }
    }
  }
}
```

**Supported languages:**
- `da` - Danish
- `en` - English
- `fi` - Finnish
- `nb-NO` - Norwegian Bokmål
- `sv` - Swedish

### 6. Translation Guidelines

Accessibility titles should:
- Describe what the icon represents visually
- Be concise (1-2 sentences)
- Use the language's natural phrasing
- Match web repository translations when available

**Example:**
```
Icon: activeAds
EN: "Sheet with image and headline with highlighted checkmark"
DA: "Ark med billede og overskrift med fremhævet flueben"
FI: "Paperiarkki, jossa kuva, otsikko ja korostettu valintamerkki"
```

### 7. Run Unit Tests

**CRITICAL:** After importing icons, run the icon unit tests to validate:

```bash
xcodebuild test -scheme WarpTests -destination 'platform=iOS Simulator,name=iPhone 16 Pro' -only-testing:WarpTests/IconTests
```

**What the tests verify:**

1. **`testRegularIconsMustNotBeEmpty`**
   - Validates SVG file is present and loads correctly
   - Checks icon image has non-zero size
   - Catches missing/corrupt SVG files

2. **`testRegularIconsMustHaveLocalization`**
   - Validates translations exist for all languages
   - Tests across all brand language configurations (DA, EN, FI, NB-NO, SV)
   - Catches missing or misconfigured translation keys

**Test failures indicate:**
- ❌ Empty image → SVG file missing or corrupt in .imageset
- ❌ Missing localization → Translation key missing or incorrect in Localizable.xcstrings

**Expected output:**
```
✔ Test testRegularIconsMustNotBeEmpty() passed
✔ Test testRegularIconsMustHaveLocalization() passed
```

## Naming Convention Mapping

| Format | Example | Usage |
|--------|---------|-------|
| kebab-case | active-ads | Web repository filename |
| PascalCase | ActiveAds | iOS asset catalog folder & SVG filename |
| camelCase | activeAds | Swift enum case, translation key suffix |

## Checklist

- [ ] Download SVG from warp-ds/elements repository
- [ ] Rename to PascalCase (e.g., active-ads.svg → ActiveAds.svg)
- [ ] Create .imageset folder in RegularIcons/
- [ ] Add SVG and Contents.json to .imageset
- [ ] Add enum case to Icon.swift (camelCase)
- [ ] Add title mapping in Icon.swift
- [ ] Add translations to Localizable.xcstrings (icon.title.{camelCase})
- [ ] Verify all 5 languages have translations
- [ ] **Run icon unit tests** (WarpTests/IconTests)
- [ ] Verify all tests pass
- [ ] Build project to verify no errors
- [ ] Test icon displays correctly in SampleApp

## Common Issues

**Icon not appearing:**
- Verify `preserves-vector-representation: true` in Contents.json
- Check SVG is valid (open in browser/viewer)
- Ensure asset catalog is included in target
- Run unit tests to verify icon loads

**Tinting not working:**
- Verify `template-rendering-intent: "template"` in Contents.json
- Check icon is rendered as template in code

**Missing translations:**
- Verify key format: `icon.title.{camelCase}`
- Check all 5 language codes are present (da, en, fi, nb-NO, sv)
- Ensure `extractionState: "manual"` is set
- Run unit tests to catch missing localizations

**Build errors:**
- Verify enum case name matches exactly (case-sensitive)
- Check for duplicate enum cases
- Ensure translation key matches Swift property name

**Unit test failures:**
```
❌ RegularIcon: activeAds should not have an empty image
→ SVG file missing or corrupt in .imageset folder

❌ RegularIcon: activeAds should have a localized name
→ Translation key missing in Localizable.xcstrings
→ Check key format: icon.title.activeAds
→ Verify all 5 languages are present
```

## Example: Complete Import

For icon `archive-box` from web repository:

1. **Asset**: `RegularIcons/ArchiveBox.imageset/ArchiveBox.svg`
2. **Enum**: `case archiveBox`
3. **Mapping**: `case .archiveBox: return Warp.Strings.iconArchiveBox.localized`
4. **Translation key**: `icon.title.archiveBox`
5. **Run tests**: `xcodebuild test -only-testing:WarpTests/IconTests`
6. **Verify**: ✔ All tests pass

## Related Files

- Icon definitions: `Sources/Icon/Icon.swift`
- Asset catalog: `Sources/Icon/Icons.xcassets/RegularIcons/`
- Translations: `Sources/Resources/Localizable.xcstrings`
- Icon tests: `Tests/WarpTests/Icon/IconTests.swift`
- Icon demo: `SampleApp/BrandItems/IconsView.swift`
