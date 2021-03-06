//
//  SlideOverCard.swift
//
//
//  Created by João Gabriel Pozzobon dos Santos on 30/10/20.
//

import SwiftUI

public struct PopUp<Content: View>: View {
    var isPresented: Binding<Bool>
    let onDismiss: (() -> Void)?
    let content: Content
    
    public init(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, content: @escaping () -> Content) {
        self.isPresented = isPresented
        self.onDismiss = onDismiss
        self.content = content()
    }
    
    public var body: some View {
            ZStack {
                if isPresented.wrappedValue {
                    
					Color.black.opacity(0.3)
						.edgesIgnoringSafeArea(.all)
						.transition(.opacity)
						.zIndex(1)
                    
                    Group {
						content
                    }
                    .zIndex(2)
                }
			}
    }
    
    func dismiss() {
        withAnimation {
            isPresented.wrappedValue = false
        }
        if (onDismiss != nil) { onDismiss!() }
    }
}
