//
//  SlideOverCardView.swift
//  
//
//  Created by João Gabriel Pozzobon dos Santos on 25/04/21.
//

import SwiftUI

@available(*, deprecated, renamed: "PopUp")
public struct PopUpView<Content: View>: View {
    var isPresented: Binding<Bool>
    let onDismiss: (() -> Void)?
    let content: Content
    
    public init(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, content: @escaping () -> Content) {
        self.isPresented = isPresented
        self.onDismiss = onDismiss
        self.content = content()
    }
    
    public init(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, content: @escaping () -> Content) {
        self.isPresented = isPresented
        self.onDismiss = onDismiss
        self.content = content()
    }
    
    public var body: some View {
        PopUp(isPresented: isPresented, onDismiss: onDismiss, content: {
            content
        })
    }
}
