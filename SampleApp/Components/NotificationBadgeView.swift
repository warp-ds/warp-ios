import SwiftUI
import Warp

struct NotificationBadgeView: View {
    @State private var type = Warp.NotificationBadgeType.default
    @State private var size = Warp.NotificationBadgeSize.medium
    @State private var contentMode = ContentMode.count
    @State private var count = 3
    @State private var maxCount = 99

    enum ContentMode: String, CaseIterable {
        case dot = "Dot"
        case count = "Count"
    }

    private var content: Warp.NotificationBadgeContent {
        contentMode == .dot ? .dot : .count(count)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                // Current badge
                GroupBox(content: {
                    HStack {
                        Spacer()
                        Warp.NotificationBadge(content, type: type, size: size, maxCount: maxCount)
                        Spacer()
                    }
                    .padding()
                }, label: {
                    Text("Current Configuration")
                })

                // All Figma variants
                GroupBox(content: {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(Warp.NotificationBadgeType.allCases, id: \.self) { variantType in
                            HStack(spacing: 16) {
                                Text(variantType == .default ? "Default" : "Primary")
                                    .frame(width: 60, alignment: .leading)
                                    .font(.caption)
                                Warp.NotificationBadge(.dot, type: variantType, size: .medium)
                                Warp.NotificationBadge(.dot, type: variantType, size: .small)
                                Warp.NotificationBadge(.count(1), type: variantType, size: .medium)
                                Warp.NotificationBadge(.count(1), type: variantType, size: .small)
                                Warp.NotificationBadge(.count(67), type: variantType, size: .medium)
                                Warp.NotificationBadge(.count(67), type: variantType, size: .small)
                                Warp.NotificationBadge(.count(150), type: variantType, size: .medium, maxCount: 99)
                                Warp.NotificationBadge(.count(150), type: variantType, size: .small, maxCount: 99)
                            }
                        }
                    }
                    .padding()
                }, label: {
                    Text("All Variants (M/S × Dot/1/67/99+)")
                })

                // Usage examples
                GroupBox(content: {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "bell.fill")
                                .foregroundStyle(Warp.Token.iconPrimary)
                            Warp.NotificationBadge(.count(5), size: .small)
                        }
                        HStack {
                            Text("Messages")
                            Warp.NotificationBadge(.dot, type: .primary, size: .small)
                        }
                        HStack {
                            Text("Inbox")
                            Spacer()
                            Warp.NotificationBadge(.count(150))
                        }
                    }
                    .padding()
                }, label: {
                    Text("Usage Examples")
                })

                // Controls
                GroupBox(content: {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Type")
                        Picker("Type", selection: $type) {
                            Text("Default").tag(Warp.NotificationBadgeType.default)
                            Text("Primary").tag(Warp.NotificationBadgeType.primary)
                        }
                        .pickerStyle(.segmented)

                        Divider()

                        Text("Size")
                        Picker("Size", selection: $size) {
                            Text("Medium").tag(Warp.NotificationBadgeSize.medium)
                            Text("Small").tag(Warp.NotificationBadgeSize.small)
                        }
                        .pickerStyle(.segmented)

                        Divider()

                        Text("Content")
                        Picker("Content", selection: $contentMode) {
                            ForEach(ContentMode.allCases, id: \.self) { mode in
                                Text(mode.rawValue).tag(mode)
                            }
                        }
                        .pickerStyle(.segmented)

                        if contentMode == .count {
                            HStack {
                                Text("Count: \(count)")
                                Spacer()
                                Stepper("", value: $count, in: -1...200)
                            }

                            HStack {
                                Text("Max count: \(maxCount)")
                                Spacer()
                                Stepper("", value: $maxCount, in: 0...999)
                            }
                        }

                        if let a11yValue = Warp.NotificationBadge(content, maxCount: maxCount).accessibilityValue {
                            Divider()
                            Text("A11y: \"\(a11yValue)\"")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }, label: {
                    Text("Configure")
                })
            }
            .padding(.horizontal)
        }
        .navigationTitle("Notification badge")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NotificationBadgeView()
}
