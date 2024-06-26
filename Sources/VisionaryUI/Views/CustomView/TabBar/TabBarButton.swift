//
//  SwiftUIView.swift
//  
//
//  Created by Shivam Maheshwari on 26/03/24.
//

import SwiftUI

public struct TabBarButtonModel<Content: View> {
    public var tabBarTitle: String
    public var content: CustomTabBarView<Content>
    
    init(tabBarTitle: String, @ViewBuilder content: () -> Content) {
        self.tabBarTitle = tabBarTitle
        self.content = CustomTabBarView(content: content)
    }
}

public struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    public var body: some View {
        Text(text)
            .fontWeight(isSelected ? .heavy : .regular)
            .font(.custom("Avenir", size: 16))
            .padding(.bottom, 10)
            .borderWithCustomEdges(width: isSelected ? 2 : 1, edges: [.bottom], color: .black)
    }
}

#Preview {
    TabBarButton(text: "Item 1", isSelected: .constant(false))
}
