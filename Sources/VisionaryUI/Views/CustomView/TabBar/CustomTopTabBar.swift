//
//  CustomTopTabBar.swift
//
//
//  Created by Shivam Maheshwari on 29/03/24.
//

import SwiftUI

public struct CustomTopTabBar: View {
    private let tabBarButtonModels: [TabBarButtonModel]
    @State var tabIndex: Int
    
    public init(tabBarButtonModels: [TabBarButtonModel],
                defaultTabIndex: Int) {
        self.tabBarButtonModels = tabBarButtonModels
        self._tabIndex = .init(initialValue: defaultTabIndex)
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(tabBarButtonModels.indices, id: \.self) { itemIndex in
                    TabBarButton(text: tabBarButtonModels[itemIndex].text,
                                 isSelected: .constant(tabIndex == itemIndex))
                    .onTapGesture {
                        onButtonTapped(index: itemIndex)
                    }
                }
            }
        }
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation(.easeInOut(duration: 0.8)) {
            tabIndex = index
        }
    }
}

#Preview {
    CustomTopTabBar(tabBarButtonModels: [TabBarButtonModel(text: "Technology"), 
                                         TabBarButtonModel(text: "Buisness"),
                                         TabBarButtonModel(text: "Social"),
                                         TabBarButtonModel(text: "Buisness"),
                                         TabBarButtonModel(text: "Technology"),
                                         TabBarButtonModel(text: "Buisness"),
                                         TabBarButtonModel(text: "Social"),
                                         TabBarButtonModel(text: "Buisness")], defaultTabIndex: 0)
}
