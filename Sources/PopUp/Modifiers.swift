//
//  Modifiers.swift
//  
//
//  Created by João Gabriel Pozzobon dos Santos on 24/04/21.
//

import SwiftUI

extension View {
    public func PopUp<Content: View>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View {
        return ZStack {
            self
			PopUp(isPresented: isPresented,
                          onDismiss: onDismiss) {
                content()
            }
        }
    }
    
    public func PopUp<Item: Identifiable, Content: View>(item: Binding<Item?>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping (Item) -> Content) -> some View {
        let binding = Binding(get: { item.wrappedValue != nil }, set: { if !$0 { item.wrappedValue = nil } })
        return self.PopUp(isPresented: binding, onDismiss: onDismiss, content: {
            if let item = item.wrappedValue {
                content(item)
            }
        })
    }
}
