import SwiftUI
import Warp

struct ModalView: View {
    @State private var title = "Title"
    @State private var subtitle = "Subtitle"
    @State private var bodyText = "Content information for your modal goes here. This is the mobile web variant that has the look and feel of a bottom sheet, which means that it must be pinned to the bottom of the page."
    @State private var hasPrimaryButton = true
    @State private var hasSecondaryButton = true
    @State private var hasCloseButton = true
    @State private var dismissOnClickOutside = true
    @State private var presentModal = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            createModalView()
            VStack(alignment: .leading) {
                Warp.Button.create(for: .primary, title: "Tap me to show the Modal", action: {
                    withAnimation {
                        presentModal = true
                    }
                }, fullWidth: true)
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            GroupBox(
                content: {
                    VStack(alignment: .leading) {
                        Text("Title")
                        Warp.TextField(text: $title)
                        Divider()
                        
                        Text("Subtitle")
                        Warp.TextField(text: $subtitle)
                        Divider()
                        
                        Text("Body Text")
                        Warp.TextField(text: $bodyText)
                        Divider()
                        
                        HStack {
                            Text("Show Primary button")
                            Spacer()
                            Warp.Switch(isOn: $hasPrimaryButton.defaultAnimation())
                        }
                        Divider()
                        
                        HStack {
                            Text("Show Secondary button")
                            Spacer()
                            Warp.Switch(isOn: $hasSecondaryButton.defaultAnimation())
                        }
                        Divider()
                        
                        HStack {
                            Text("Show Close button")
                            Spacer()
                            Warp.Switch(isOn: $hasCloseButton.defaultAnimation())
                        }
                        Divider()
                        
                        HStack {
                            Text("Dismiss on click outside")
                            Spacer()
                            Warp.Switch(isOn: $dismissOnClickOutside.defaultAnimation())
                        }
                    }
                }, label: {
                    Text("Modify Modal")
                }
            )
            .padding(.horizontal)
        }
        .navigationTitle("Modal")
        .navigationBarTitleDisplayMode(.inline)
        .warpModal(
            title: title,
            subtitle: subtitle,
            bodyText: bodyText,
            primaryButton: getPrimaryButtonProvider(),
            secondaryButton: getSecondaryButtonProvider(),
            closeButton: hasCloseButton,
            dismissOnClickOutside: dismissOnClickOutside,
            onDismiss: {
                print("Modal dismissed")
            },
            isPresented: $presentModal)
    }
    
    private func createModalView() -> some View {
        return Warp.Modal(
            title: title,
            subtitle: subtitle,
            bodyText: bodyText,
            primaryButton: getPrimaryButtonProvider(),
            secondaryButton: getSecondaryButtonProvider(),
            hasCloseButton: hasCloseButton,
            isPresented: .constant(true)
        )
    }
    
    private func getPrimaryButtonProvider() -> Warp.Modal.ButtonConstructor? {
        if hasPrimaryButton {
            return (
                title: "Confirm",
                action: {
                    presentModal = false
                }
            )
        }
        
        return nil
    }
    
    private func getSecondaryButtonProvider() -> Warp.Modal.ButtonConstructor? {
        if hasSecondaryButton {
            return (
                title: "Cancel",
                action: {
                    presentModal = false
                }
            )
        }
        
        return nil
    }
}

private extension Binding<Bool> {
    func defaultAnimation() -> Binding<Bool> {
        animation(.bouncy)
    }
}

#Preview {
    ModalView()
}
