
# Warp Design System (iOS)

Welcome to the **Warp Design System** for iOS! This repository contains components and guidelines to help developers build unified, accessible, and visually consistent user interfaces for iOS apps. Warp's design system streamlines the development process while ensuring that all components align with iOS design best practices.

For detailed setup and component documentation, visit the **[Warp Portal Documentation for the Warp Design System](https://warp-ds.github.io/tech-docs/getting-started/ios/)**.

## Components

Explore the following iOS components provided by Warp Design System. Each component links to its detailed documentation for usage, customization, and integration instructions:

- **[Button](https://warp-ds.github.io/tech-docs/components/buttons/)**  
- **[Pill](https://warp-ds.github.io/tech-docs/components/pill/)**  
- **[Checkbox](https://warp-ds.github.io/tech-docs/components/checkbox/)**  
- **[Text Field](https://warp-ds.github.io/tech-docs/components/textfield/)**  
- **[Alert](https://warp-ds.github.io/tech-docs/components/alert/)**  
- **[Steps](https://warp-ds.github.io/tech-docs/components/steps/)**  
- **[Icons](https://warp-ds.github.io/tech-docs/components/icons/)**  
- **[Badge](https://warp-ds.github.io/tech-docs/components/badge/)**  
- **[Box](https://warp-ds.github.io/tech-docs/components/box/)**  
- **[Broadcast](https://warp-ds.github.io/tech-docs/components/broadcast/)**  
- **[Expandable](https://warp-ds.github.io/tech-docs/components/expandable/)**  
- **[Text](https://warp-ds.github.io/tech-docs/components/text/)**  
- **[Toast](https://warp-ds.github.io/tech-docs/components/toast/)**  
- **[Callout](https://warp-ds.github.io/tech-docs/components/callout/)**  
- **[Modal](https://warp-ds.github.io/tech-docs/components/modal/)**  
- **[Spinner](https://warp-ds.github.io/tech-docs/components/spinner/)**  
- **[Tooltip](https://warp-ds.github.io/tech-docs/components/tooltip/)**  


## Getting Started for iOS Developers

This guide describes how to get started building an application using Warp components. If you have any questions or need clarification, please don't hesitate to reach out to the Warp team on the **#nmp-warp-design-system** channel on Slack!

### 1. Integrate Warp

To integrate Warp into your project, follow these steps:

#### Swift Package Manager

You can use the Warp URL with Xcode's default package manager or include it in your `Package.swift` file like this:

```swift
dependencies: [
    .package(url: "https://github.com/warp-ds/warp-ios.git")
]
```

We recommend using the latest version to avoid dependency conflicts. You can specify the version range as follows:

```swift
dependencies: [
    .package(url: "https://github.com/warp-ds/warp-ios.git", "0.0.1"..."999.0.0")
]
```

### 2. Apply Theme

To start using Warp, initialize the theme based on your selected project target:

```swift
Warp.Config.warpTheme = .tori
```

Currently, we support the following themes:

- `.finn` (default)
- `.tori`
- `.dba`
- `.blocket`

### 3. Use Warp Components

Warp components are easy to use with SwiftUI or UIKit. Depending on your selected target, the components will adapt the correct colors and styling.

Example using a Warp button:

```swift
Warp.Button.create(
    for: .primary,
    title: "button",
    icon: Image(systemName: "plus"),
    action: {}
)
```

### 4. Use Warp Tokens

To ensure brand consistency, we recommend using **Warp Tokens** for colors and styling. Tokens follow categories like `Surface`, `Background`, `Border`, `Icon`, and `Text`.

Avoid using direct colors since they can vary between brands. Instead, use tokens like this:

```swift
Warp.Text(
    L10n.ConfirmPersonalData.ConfirmPersonalData.collectioninfo,
    style: .caption,
    color: Warp.Token.textSubtle
)
```

Still using UIKit? Warp supports it as well with **Warp.UIToken**.

```swift
private lazy var myView: UIView = {
    let view = UIView(withAutoLayout: true)
    view.backgroundColor = Warp.UIToken.background
    return view
}()
```

