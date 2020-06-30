//
//  TabViewController.swift
//  Employ-Me
//
//  Created by Morgan Belous on 6/12/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    
    var userDict: NSDictionary!
    
    init(userDict: NSDictionary){
        self.userDict = userDict
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        self.navigationItem.setHidesBackButton(true, animated: true);
        tabBar.barTintColor = .lightGray
        setupTabBar()
    }
    
    func setupTabBar(){
        
        let jobsController = createNavController(vc: ViewController(), selected: UIImage(named: "home-black.png")!, unselected: UIImage(named: "home-white.png")!)
        
        let profileVC = ProfileViewController(name: userDict["name"]! as! String, email: userDict["email"]! as! String)
         let profileController = createNavController(vc: profileVC, selected: UIImage(named: "user-black.png")!, unselected: UIImage(named: "user-white.png")!)
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

extension UITabBarController: UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let profileVC = tabBarController.viewControllers?[1] as! UINavigationController
        profileVC.popViewController(animated: false)
    }
}
