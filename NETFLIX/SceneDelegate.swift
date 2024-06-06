//
//  SceneDelegate.swift
//  NETFLIX
//
//  Created by NERO on 6/4/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()
        
        let homeVC = HomeViewController()
        let boxOfficeVC = BoxOfficeViewController()
        
        let firstNav = UINavigationController(rootViewController: homeVC)
        let secondNav = UINavigationController(rootViewController: boxOfficeVC)
        
        firstNav.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 0)
        secondNav.tabBarItem = UITabBarItem(title: "박스오피스", image: UIImage(systemName: "movieclapper.fill"), tag: 1)
        
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.unselectedItemTintColor = .gray
        tabBarController.tabBar.backgroundColor = .secondaryLabel
        tabBarController.setViewControllers([firstNav, secondNav], animated: true)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
