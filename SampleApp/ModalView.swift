//
//  ModalView.swift
//  Finn
//
//  Created by Milad Ajilianabbasi on 2024-06-12.
//

import Foundation
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
        NavigationView {
            ScrollView {
                VStack {
                    createModalView()
                    VStack(alignment: .leading) {
                        Button(action: {
                            withAnimation {
                                presentModal = true
                            }
                            
                        }, label: {
                            Text("Tap me to show the Modal")
                                .frame(maxWidth: .infinity)
                        })
                        .buttonStyle(.borderedProminent)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    
                    GroupBox(
                        content: {
                            Warp.TextField(text: $title)
                                .defaultPadding()
                        }, label: {
                            Text("Title")
                        }
                    )
                    
                    GroupBox(
                        content: {
                            Warp.TextField(text: $subtitle)
                                .defaultPadding()
                        }, label: {
                            Text("Subtitle")
                        }
                    )
                    
                    GroupBox(
                        content: {
                            Warp.TextField(text: $bodyText)
                                .defaultPadding()
                        }, label: {
                            Text("Body Text")
                        }
                    )
                    
                    GroupBox(
                        content: {
                            Toggle(isOn: $hasPrimaryButton.defaultAnimation()) {
                                createToggleLabelView(hasValue: hasPrimaryButton, tag: "primary button")
                            }
                            .defaultPadding()
                        }, label: {
                            Text("Primary button")
                        }
                    )
                    
                    GroupBox(
                        content: {
                            Toggle(isOn: $hasSecondaryButton) {
                                createToggleLabelView(hasValue: hasSecondaryButton, tag: "secondary button")
                            }
                            .defaultPadding()
                        }, label: {
                            Text("Secondary button")
                        }
                    )
                    
                    GroupBox(
                        content: {
                            Toggle(isOn: $hasCloseButton) {
                                createToggleLabelView(hasValue: hasCloseButton, tag: "close button")
                            }
                            .defaultPadding()
                        }, label: {
                            Text("Close button")
                        }
                    )
                    
                    GroupBox(
                        content: {
                            Toggle(isOn: $dismissOnClickOutside) {
                                createToggleLabelView(hasValue: dismissOnClickOutside, tag: "dismiss on click outside")
                            }
                            .defaultPadding()
                        }, label: {
                            Text("Dismiss on click outside")
                        }
                    )
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("Modal")
        }
        
        .warpModal(
            title: title,
            subtitle: subtitle,
            bodyText: bodyText,
            primaryButton: getPrimaryButtonProvider(),
            secondaryButton: getSecondaryButtonProvider(),
            closeButton: hasCloseButton,
            dismissOnClickOutside: dismissOnClickOutside,
            isPresented: $presentModal,
            colorProvider: Warp.Config.colorProvider)
    }

    private func createModalView() -> some View {
        return Warp.Modal(
            title: title,
            subtitle: subtitle,
            bodyText: bodyText,
            primaryButton: getPrimaryButtonProvider(),
            secondaryButton: getSecondaryButtonProvider(),
            hasCloseButton: hasCloseButton,
            isPresented: .constant(true),
            colorProvider: Warp.Config.colorProvider
        )
    }

    private func createToggleLabelView(hasValue: Bool, tag: String) -> some View {
        HStack {
            let prependStaticText = !hasValue ? "Add": "Remove"

            Text(prependStaticText + " \(tag)")

            Spacer()
        }
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

private extension View {
    func defaultPadding() -> some View {
        padding(.all, 8)
    }
}

#Preview {
    ModalView()
}
