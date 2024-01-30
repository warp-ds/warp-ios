import Foundation
import SwiftUI

extension Warp {
    private static let toastCornerRadius: Double = 8

    public struct Toast: View {

        /// Preferred style of toast
        let style: ToastStyle

        /// Text that will be shown in toast
        let title: String

        /// Egde from where the toast is presented
        let toastEdge: Warp.ToastEdge

        @Binding public var isPresented: Bool

        /// Object responsible for providing colors in different environments and variants.
        let colorProvider: ColorProvider

        public init(
            style: Warp.ToastStyle,
            title: String,
            toastEdge: Warp.ToastEdge,
            isPresented: Binding<Bool>,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.style = style
            self.title = title
            self.toastEdge = toastEdge
            self._isPresented = isPresented
            self.colorProvider = colorProvider
        }

        public var body: some View {
            contentView
            .overlay(
                RoundedRectangle(cornerRadius: toastCornerRadius)
                    .stroke(style.subtleBorderColor(from: colorProvider), lineWidth: 2)
            )
            .frame(maxWidth: .infinity)
            .background(style.backgroundColor(from: colorProvider))
            .cornerRadius(toastCornerRadius)
            .padding(.horizontal, 16)
            .transition(AnyTransition.move(edge: toastEdge.asEdge).combined(with: .opacity))
            .onTapGesture {
                withAnimation {
                    isPresented.toggle()
                }
            }
        }

        private var contentView: some View {
            HStack(spacing: 0) {
                style.icon

                Text(title)
                    .padding(.leading, 8)
                    .foregroundStyle(style.textColor(from: colorProvider))
                    .font(from: Typography.body)

                Spacer()

                Image("icon_toast-close", bundle: .module)
            }
            .padding(16)
        }
    }
}

extension Warp.ToastStyle {
    fileprivate func backgroundColor(from colorProvider: ColorProvider) -> Color {
        switch self {
        case .error:
            colorProvider.toastNegativeBackground
        case .success:
            colorProvider.toastPositiveBackground
        case .warning:
            colorProvider.toastWarningBackground
        }
    }

    fileprivate func subtleBorderColor(from colorProvider: ColorProvider) -> Color {
        switch self {
        case .error:
            colorProvider.toastNegativeSubtleBorder
        case .success:
            colorProvider.toastPositiveSubtleBorder
        case .warning:
            colorProvider.toastWarningSubtleBorder
        }
    }

    fileprivate func textColor(from colorProvider: ColorProvider) -> Color {
        switch self {
        case .error:
            colorProvider.toastNegativeText
        case .success:
            colorProvider.toastPositiveText
        case .warning:
            colorProvider.toastWarningText
        }
    }

    fileprivate var icon: Image {
        switch self {
        case .error:
            Image("icon_toast-error", bundle: .module)
        case .success:
            Image("icon_toast-success", bundle: .module)
        case .warning:
            Image("icon_toast-warning", bundle: .module)
        }
    }
}

#Preview {
    Warp.Toast(
        style: .success,
        title: "This is a success toast",
        toastEdge: .top,
        isPresented: .constant(true)
    )
}
