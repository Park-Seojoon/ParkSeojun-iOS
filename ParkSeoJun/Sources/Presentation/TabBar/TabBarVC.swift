//
//  TabBarVC.swift
//  ParkSeoJun
//
//  Created by 신아인 on 2023/07/26.
//

import UIKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    let HEIGHT_TAB_BAR:CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        let homeVC = VC()
        let writeVC = VC()
        let mypageVC = VC()
        
        tabBar.tintColor = UIColor(rgb: 0x5074F3)
        tabBar.backgroundColor = .white
        
        // set tabbar shadow
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 6
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house")?.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysTemplate))
        writeVC.tabBarItem = UITabBarItem(title: "글쓰기", image: UIImage(systemName: "square.and.pencil")?.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(systemName: "square.and.pencil")?.withRenderingMode(.alwaysTemplate))
        mypageVC.tabBarItem = UITabBarItem(title: "프로필", image: UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(systemName: "person.circle.fill")?.withRenderingMode(.alwaysTemplate))
        
        let navigationHome = UINavigationController(rootViewController: homeVC)
        let navigationWrite = UINavigationController(rootViewController: writeVC)
        let navigationMypage = UINavigationController(rootViewController: mypageVC)
        
        setViewControllers([navigationHome, navigationWrite, navigationMypage], animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = HEIGHT_TAB_BAR
        tabFrame.origin.y = self.view.frame.size.height - HEIGHT_TAB_BAR
        self.tabBar.frame = tabFrame
    }
}
