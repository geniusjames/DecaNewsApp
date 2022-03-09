//
//  SettingOptions.swift
//  DecaNews
//
//  Created by Decagon on 09/03/2022.
//

import Foundation

enum SettingOptions: CaseIterable {
    case membership
    case notification
    case language
    case changePassword
    case darkMode
    case community
    case faqAndHelp
    case about
    case logout
    
    var displayname: String {
        switch self {
        case .membership:
            return "Membership"
        case .notification:
            return "Notification"
        case .language:
            return "Language"
        case .changePassword:
            return "Change Password"
        case .darkMode:
            return "Dark Mode"
        case .community:
            return "Community"
        case .faqAndHelp:
            return "FAQ & Help"
        case .about:
            return "About"
        case .logout:
            return "Logout"
        
        }
    }
}
    
