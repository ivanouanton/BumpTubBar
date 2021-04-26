//
//  TabItem.swift
//  CustomTabBar
//
//  Created by Антон Иванов on 25.04.21.
//

import UIKit

enum TabItem: String, CaseIterable {
    case home = "home"
    case calender = "calender"
    case friends = "friends"
    case profile = "profile"
    
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return ViewController1()
        case .calender:
            return ViewController2()
        case .friends:
            return ViewController3()
        case .profile:
            return ViewController4()
        }
    }
    
    var icon: UIImage? {
        let img: UIImage
        
        switch self {
        case .home:
            img = UIImage(named: "icon_home")!
        case .calender:
            img = UIImage(named: "icon_calender")!
        case .friends:
            img = UIImage(named: "icon_friends")!
        case .profile:
            img = UIImage(named: "icon_profile")!
        }
        return img.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
