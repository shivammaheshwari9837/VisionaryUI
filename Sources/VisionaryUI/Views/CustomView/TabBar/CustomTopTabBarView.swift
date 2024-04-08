//
//  CustomTopTabBar.swift
//
//
//  Created by Shivam Maheshwari on 29/03/24.
//

import SwiftUI

public struct CustomTabBarView<Content: View>: View {
    let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        VStack {
            content
        }
    }
}

public struct CustomTopTabBarView: View {
    private let tabBarButtonModels: [TabBarButtonModel<AnyView>]
    @State var tabIndex: Int
    
    private struct Constants {
        static let tabBarViewHeight: CGFloat = 325.0
    }
    
    public init(tabBarButtonModels: [TabBarButtonModel<AnyView>],
                defaultTabIndex: Int) {
        self.tabBarButtonModels = tabBarButtonModels
        self._tabIndex = .init(initialValue: defaultTabIndex)
    }
    
    public var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabBarButtonModels.indices, id: \.self) { itemIndex in
                        TabBarButton(text: tabBarButtonModels[itemIndex].tabBarTitle,
                                     isSelected: .constant(tabIndex == itemIndex))
                        .onTapGesture {
                            onButtonTapped(index: itemIndex)
                        }
                    }
                }
            }
            ForEach(tabBarButtonModels.indices, id: \.self) { itemIndex in
                if itemIndex == tabIndex {
                    GeometryReader(content: { geometry in
                        tabBarButtonModels[itemIndex].content
                            .frame(width: geometry.size.width, height: Constants.tabBarViewHeight)
                    })
                }
            }
        }
    }
    
    private func onButtonTapped(index: Int) {
        tabIndex = index
    }
}

#Preview {
    CustomTopTabBarView(tabBarButtonModels: [TabBarButtonModel(tabBarTitle: "Technology", content: {
        AnyView(Text("Technology"))
    }), TabBarButtonModel(tabBarTitle: "Buisness", content: {
        AnyView(Text("Buisness"))
    })], defaultTabIndex: 0)
}
