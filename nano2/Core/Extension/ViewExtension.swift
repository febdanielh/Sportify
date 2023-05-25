//
//  ViewExtension.swift
//  nano2
//
//  Created by Febrian Daniel on 19/05/23.
//

import SwiftUI
import MapKit

extension View{
    @ViewBuilder
    func bottomSheet<Content: View>(
        presentationDetents: Set<PresentationDetent>,
        isPresented: Binding<Bool>,
        dragIndicator: Visibility = .visible,
        sheetCornerRadius: CGFloat?,
        largestUndimmedIdentifier: UISheetPresentationController.Detent.Identifier = .large,
        isTransparentBG: Bool = false,
        interactiveDisabled: Bool = true,
        presentationInteractionEnabled: PresentationBackgroundInteraction,
        @ViewBuilder content: @escaping ()->Content,
        onDismiss: @escaping ()->()
    )->some View{
        self
            .sheet(isPresented: isPresented){
                onDismiss()
            } content: {
                content()
                    .presentationDetents(presentationDetents)
                    .presentationDragIndicator(dragIndicator)
                    .interactiveDismissDisabled(interactiveDisabled)
                    .presentationBackgroundInteraction(presentationInteractionEnabled)
                    .onAppear{
                        guard let windows = UIApplication.shared.connectedScenes.first as?
                                UIWindowScene else {
                            return
                        }
                        
                        if let controller = windows.windows.first?.rootViewController?.presentedViewController, let sheet = controller.presentationController as? UISheetPresentationController{
                            
                            if isTransparentBG == true{
                                controller.view.backgroundColor = .clear
                            }
                            
                            controller.presentingViewController?.view.tintAdjustmentMode = .normal
                            
                            sheet.largestUndimmedDetentIdentifier = largestUndimmedIdentifier
                            sheet.preferredCornerRadius = sheetCornerRadius
                            
                        }
                        else {
                            print("no controller found")
                        }
                    }
            }
    }
}
