//
//  VCFactory.swift
//  TortaCafe
//
//  Created by Denis Sheikherev on 04.05.2021.
//

import UIKit

protocol VCFactory {
    func makeRootViewController() -> UIViewController
}

class DefaultVCFactory: VCFactory {
    func makeRootViewController() -> UIViewController {
        
        let homeVC = HomeViewController()
        let scanVC = ScanViewController()
        let orderVC = OrderViewController()
        let giftVC = GiftViewController()
        let storeVC = StoreViewController()
        
        //        let homeNC = UINavigationController(rootViewController: homeVC)
        //        homeNC.navigationBar.isTranslucent = false
        let scanNC = UINavigationController(rootViewController: scanVC)
        let orderNC = UINavigationController(rootViewController: orderVC)
        let giftNC = UINavigationController(rootViewController: giftVC)
        let storeNC = UINavigationController(rootViewController: storeVC)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeVC, scanNC, orderNC, giftNC, storeNC]
        
        return tabBarController
    }
}
