//
//  AppTabBarViewController.swift
//  CustomTabBar
//
//  Created by Anton Ivanou on 25.04.21.
//

import UIKit

class AppTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:
                                                            UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:
                                                            UIColor.systemYellow], for: .selected)
        
        loadTabBar()

        let customTabBar = BumpTabBar(frame: tabBar.frame)
        customTabBar.mainButtonHandler = {
            let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                    
                    case .destructive:
                    print("destructive")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
        setValue(customTabBar, forKey: "tabBar")
    }
    
    private func loadTabBar() {
        let tabItems: [TabItem] = [.home, .calender, .friends, .profile]
        var viewControllerList: [UIViewController] = []

        
        for (key, tabItem) in tabItems.enumerated() {
            
            let vc = tabItem.viewController
            vc.tabBarItem = UITabBarItem(title: tabItem.displayTitle, image: tabItem.icon, selectedImage: tabItem.icon)
            vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: -15, vertical: 0)
            
            var hOffSet: CGFloat
            switch key {
            case 0:
                hOffSet = -15
            case 1:
                hOffSet = -25
            case 2:
                hOffSet = 25
            case 3:
                hOffSet = 15
            default:
                hOffSet = 0
            }
            
            vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: hOffSet, vertical: -5)
            viewControllerList.append(vc)
        }
        
        viewControllers = viewControllerList
        
        self.selectedIndex = 0
    }
}
