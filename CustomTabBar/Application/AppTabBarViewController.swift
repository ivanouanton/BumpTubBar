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
        
        self.loadTabBar()
        
        view.backgroundColor = .white

        UITabBar.appearance().barTintColor = .brown

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:
                                                            UIColor.red], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:
                                                            UIColor.green], for: .selected)
    }
    
    private func loadTabBar() {
        let tabItems: [TabItem] = [.home, .calender, .friends, .profile]
        var viewControllerList: [UIViewController] = []

        
        for tabItem in tabItems {
            
            let vc = tabItem.viewController
            vc.tabBarItem = UITabBarItem(title: tabItem.displayTitle, image: tabItem.icon, selectedImage: tabItem.icon)
            viewControllerList.append(vc)
        }
        
        viewControllers = viewControllerList
        
        self.selectedIndex = 0
    }
}
