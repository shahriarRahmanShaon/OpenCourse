//
//  Styles.swift
//  InfinityCourse
//
//  Created by sergio shaon on 14/4/22.
//

import SwiftUI
struct PaddingStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
    }
}

extension View{
    func paddingStyle() -> some View{
        modifier(PaddingStyle())
    }
}
