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
        
        let homeNC = makeNavigationController(rootViewController: homeVC)
        let scanNC = UINavigationController(rootViewController: scanVC)
        let orderNC = UINavigationController(rootViewController: orderVC)
        let giftNC = UINavigationController(rootViewController: giftVC)
        let storeNC = UINavigationController(rootViewController: storeVC)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeNC, scanNC, orderNC, giftNC, storeNC]
        
        return tabBarController
    }
    
    func makeNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        let color: UIColor
        
        if #available(iOS 13.0, *) {
            color = UIColor.label
        } else {
            color = UIColor.black
        }
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1).bold()
        ]
        
        navigationController.navigationBar.largeTitleTextAttributes = attrs
        
        return navigationController
    }
}
