//
//  MenuOption.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 04/03/2022.
//

import Foundation

enum MenuOption: CaseIterable {
    case profile
    case writeNews
    
    var displayname: String {
        switch self {
        case .profile:
            return "Profile"
        case .writeNews:
            return "Write News"
        }
    }
    
    var icon: String {
        switch self {
        case .profile:
            return ""
        case .writeNews:
            return ""
        }
    }
}
