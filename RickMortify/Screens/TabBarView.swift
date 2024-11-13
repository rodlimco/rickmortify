//
//  TabBarView.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

import SwiftUI

struct TabBarView: View {

    @State private var selectedIndex: Int = 0

    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(Array(TabBarItems.allCases.enumerated()), id: \.element) { index, element in
                NavigationStack() {
                    viewForTab(element)
                        .navigationTitle(element.title)
                }
                .tabItem {
                    Text(element.title)
                    Image(selectedIndex == index ? element.selectedIcon : element.deselectedIcon)
                }
                .tag(index)
            }
        }
    }
    
    @ViewBuilder
    private func viewForTab(_ tab: TabBarItems) -> some View {
        switch tab {
        case .characters:
            CharactersListView()
        default:
            Text(tab.title)
        }
    }
}

#Preview {
    TabBarView()
}
