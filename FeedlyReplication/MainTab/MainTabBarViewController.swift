//
//  MainTabBarViewController.swift
//  FeedlyReplication
//
//  Created by Alexander Konovalov on 22.09.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    func setupUi() {
        let selectedColor = UIColor.mainGreen
        
        self.view.tintColor = selectedColor
        
        let item1 = UITabBarItem()
        let item2 = UITabBarItem()
        let item3 = UITabBarItem()
        let item4 = UITabBarItem()
        let item5 = UITabBarItem()
        item1.image = UIImage(named: "lines")
        item2.image = UIImage(named: "flag")
        item3.image = UIImage(named: "middle")
        item4.image = UIImage(named: "plus")
        item5.image = UIImage(named: "zoom")
        
        let leftSideBarNavigationController = UINavigationController(rootViewController: LeftSideBarViewController())
        let readLaterNavigationController = UINavigationController(rootViewController: ReadLaterViewController())
        let allFeedsNavigationController = UINavigationController(rootViewController: AllFeedsViewController())
        let addContentNavigationController = UINavigationController(rootViewController: AddContentViewController())
        let powerSearchNavigationController = UINavigationController(rootViewController: PowerSearchViewController())
        leftSideBarNavigationController.tabBarItem = item1
        readLaterNavigationController.tabBarItem = item2
        allFeedsNavigationController.tabBarItem = item3
        addContentNavigationController.tabBarItem = item4
        powerSearchNavigationController.tabBarItem = item5
        
        self.viewControllers = [leftSideBarNavigationController, readLaterNavigationController, allFeedsNavigationController,
                                addContentNavigationController, powerSearchNavigationController]
        self.selectedViewController = allFeedsNavigationController
    }
    
    
}
