//
//  TabBarItems.swift
//  RickMortify
//
//  Created by Rodrigo Limpias Cossio on 13/11/24.
//

enum TabBarItems: String, CaseIterable {
    case characters
    case episodes
    case locations

    var title: String {
        return self.rawValue.capitalized
    }

    var selectedIcon: String {
        return "tab_bar-\(self.rawValue.lowercased())-selected"
    }

    var deselectedIcon: String {
        return "tab_bar-\(self.rawValue.lowercased())-deselected"
    }
}
