//
//  TabViewController.swift
//  Employ-Me
//
//  Created by Morgan Belous on 6/12/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true);
        tabBar.barTintColor = .lightGray
        setupTabBar()
    }
    
    func setupTabBar(){
        
        let jobsController = createNavController(vc: ViewController(), selected: UIImage(named: "home-black.png")!, unselected: UIImage(named: "home-white.png")!)
        
         let profileController = createNavController(vc: ProfileViewController(), selected: UIImage(named: "user-black.png")!, unselected: UIImage(named: "user-white.png")!)
        viewControllers = [jobsController, profileController]
        
        guard let items = tabBar.items else {return}
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}

extension UITabBarController {
    
    func createNavController(vc: UIViewController, selected: UIImage, unselected: UIImage) -> UIViewController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
        return navController
    }
    
    
}
