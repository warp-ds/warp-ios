# Migration Guide: Global Theme → Environment-Based Injection

This guide explains how to migrate from the global `Warp.Theme` variable to the new `@Environment`-based theme injection system.

## Why Migrate?

The old global approach has several problems:

1. **Not Swift 6 concurrency-safe**: Global mutable state violates strict concurrency rules
2. **Hard to test**: Can't test different themes in parallel
3. **Unexpected side effects**: Changing `Warp.Theme` affects all views globally
4. **Preview pollution**: Preview modifiers mutate global state
5. **Poor encapsulation**: Views implicitly depend on global state

The new system uses SwiftUI's `@Environment` for proper dependency injection.

## Migration Steps

### 1. Update App Entry Point

**Before:**
```swift
@main
struct MyApp: App {
    init() {
        Warp.Theme = .finn  // ❌ Global mutation
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

**After:**
```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .warpTheme(.finn)  // ✅ Environment injection
        }
    }
}
```

### 2. Update View Code

**Before:**
```swift
struct MyView: View {
    var body: some View {
        Text("Hello")
            .foregroundColor(Warp.Color.textPrimary)  // ❌ Uses global Warp.Theme
    }
}
```

**After:**
```swift
struct MyView: View {
    @Environment(\.warpTheme) private var theme
    
    var body: some View {
        Text("Hello")
            .foregroundColor(ColorProvider(theme: theme).textPrimary)  // ✅ Explicit theme
    }
}
```

### 3. Update Previews

**Before:**
```swift
#Preview {
    Warp.Theme = .tori  // ❌ Mutates global state
    return MyView()
}
```

**After (iOS 18+):**
```swift
#Preview(traits: .themeTori) {  // ✅ Environment injection
    MyView()
}
```

**After (iOS 17 and earlier):**
```swift
#Preview {
    MyView()
        .warpTheme(.tori)  // ✅ Environment injection
}
```

### 4. Update Font Registration

**Before:**
```swift
Warp.Theme = .finn
try? Warp.Typography.registerFonts()  // ❌ Uses global theme
```

**After:**
```swift
let theme = Warp.Brand.finn
try? Warp.Typography.registerFonts(for: theme)  // ✅ Explicit theme
```

### 5. Update Tests

**Before:**
```swift
func testMyView() {
    Warp.Theme = .dba  // ❌ Pollutes test isolation
    let view = MyView()
    // ...
}
```

**After:**
```swift
func testMyView() {
    let view = MyView()
        .warpTheme(.dba)  // ✅ Test-scoped theme
    // ...
}
```

## API Reference

### New APIs

#### Environment Key
```swift
@Environment(\.warpTheme) private var theme: Warp.Brand
```

#### View Modifier
```swift
.warpTheme(_ theme: Warp.Brand) -> some View
```

#### ColorProvider
```swift
ColorProvider(theme: Warp.Brand)  // ✅ New primary initializer
ColorProvider(token: TokenProvider)  // ⚠️ Deprecated, still uses global theme
```

#### UIColorProvider
```swift
UIColorProvider(theme: Warp.Brand)  // ✅ New primary initializer
UIColorProvider(token: UITokenProvider)  // ⚠️ Deprecated, still uses global theme
```

#### Typography
```swift
Warp.Typography.registerFonts(for: Warp.Brand)  // ✅ New
Warp.Typography.registerFonts()  // ⚠️ Deprecated, uses global theme
```

#### Font
```swift
Warp.Font.fonts(for: Warp.Brand)  // ✅ New
Warp.Font.fontForTheme  // ⚠️ Deprecated, uses global theme
```

### Deprecated APIs

These still work but show warnings:

- `Warp.Color` → Use `ColorProvider(theme:)` with `@Environment(\.warpTheme)`
- `Warp.UIColor` → Use `UIColorProvider(theme:)` with `@Environment(\.warpTheme)`
- `ColorProvider(token:)` → Use `ColorProvider(theme:)`
- `UIColorProvider(token:)` → Use `UIColorProvider(theme:)`
- `Warp.Typography.registerFonts()` → Use `registerFonts(for:)`
- `Warp.Font.fontForTheme` → Use `fonts(for:)`

## Advanced Patterns

### Theme Switching at Runtime

**Before:**
```swift
Button("Switch Theme") {
    Warp.Theme = .tori  // ❌ Global mutation
}
```

**After:**
```swift
@State private var currentTheme: Warp.Brand = .finn

var body: some View {
    VStack {
        MyContent()
        
        Button("Switch Theme") {
            currentTheme = .tori  // ✅ Local state
        }
    }
    .warpTheme(currentTheme)
}
```

### Passing Theme to Child Views

The environment automatically propagates:

```swift
struct ParentView: View {
    var body: some View {
        VStack {
            ChildView()  // Automatically inherits theme
        }
        .warpTheme(.finn)
    }
}

struct ChildView: View {
    @Environment(\.warpTheme) private var theme  // ✅ Gets .finn
    
    var body: some View {
        Text("Themed text")
            .foregroundColor(ColorProvider(theme: theme).textPrimary)
    }
}
```

### Testing Different Themes in Parallel

Now possible with environment isolation:

```swift
func testAllThemes() async {
    await withTaskGroup(of: Void.self) { group in
        for theme in Warp.Brand.allCases {
            group.addTask {
                let view = MyView().warpTheme(theme)
                // Test view with this theme
            }
        }
    }
}
```

## Common Pitfalls

### ❌ Forgetting to inject theme
```swift
struct MyView: View {
    @Environment(\.warpTheme) private var theme
    var body: some View {
        // Using Warp.Color instead of ColorProvider(theme: theme)
        Text("Hello").foregroundColor(Warp.Color.textPrimary)  // ❌ Still uses global
    }
}
```

**Fix:** Use the environment value:
```swift
Text("Hello").foregroundColor(ColorProvider(theme: theme).textPrimary)  // ✅
```

### ❌ Setting theme too late in view hierarchy
```swift
struct ContentView: View {
    var body: some View {
        TabView {
            FirstTab().warpTheme(.finn)   // ❌ Different themes per tab?
            SecondTab().warpTheme(.tori)  // ❌ Probably not what you want
        }
    }
}
```

**Fix:** Set theme at the root:
```swift
struct ContentView: View {
    var body: some View {
        TabView {
            FirstTab()
            SecondTab()
        }
        .warpTheme(.finn)  // ✅ Consistent theme for whole app
    }
}
```

## Backwards Compatibility

The global `Warp.Theme` still works for backwards compatibility, but shows deprecation warnings. You can migrate incrementally:

1. **Phase 1**: Add `.warpTheme()` at app root
2. **Phase 2**: Update views one by one to use `@Environment(\.warpTheme)`
3. **Phase 3**: Remove all `Warp.Theme` assignments
4. **Phase 4**: Update generators to emit theme-parameter code

The deprecated APIs will continue to work until a future major version.

## Generator Updates

If you're using the token generator from https://github.com/warp-ds/tokens:

### ColorProvider Generator

Update to emit:
```swift
public struct ColorProvider {
    public let theme: Warp.Brand
    public let token: TokenProvider
    
    public init(theme: Warp.Brand) {
        self.theme = theme
        self.token = Self.tokenProvider(for: theme)
    }
    
    public var badgeNeutralBackground: Color {
        switch theme {  // Use parameter, not Warp.Theme
            // ...
        }
    }
}
```

## Swift 6 Concurrency Benefits

The new system is fully Swift 6 strict concurrency compliant:

```swift
// ✅ Sendable-safe
struct ColorProvider: Sendable {
    public let theme: Warp.Brand  // Sendable enum
    public let token: TokenProvider  // Sendable struct
    // ...
}

// ✅ No data races
@MainActor
struct MyView: View {
    @Environment(\.warpTheme) private var theme  // Isolated to MainActor
    // ...
}
```

## Questions?

See the Swift 6 concurrency audit report for related concurrency issues:
- Missing `@MainActor` on UIViewControllers
- Legacy `DispatchQueue` patterns to modernize

For issues or feedback, file an issue at: [your repo URL]
