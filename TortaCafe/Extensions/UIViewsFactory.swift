//
//  UIViewsFactory.swift
//  TortaCafe
//
//  Created by Denis Sheikherev on 05.05.2021.
//

import ColorCompatibility
import Foundation
import UIKit

enum SymbolScale {
    case small, medium, large
}

func makeSymbolImage(imageName: String, scale: SymbolScale = .large) -> UIImage? {
    let image: UIImage?
    
    if #available(iOS 13.0, *) {
        var compatabilityScale: UIImage.SymbolScale
        
        switch scale {
            case .small:
                compatabilityScale = .small
            case .medium:
                compatabilityScale = .medium
            case .large:
                compatabilityScale = .large
        }
        
        image = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(scale: compatabilityScale))
    } else {
        image = UIImage(named: "qrcode")
    }
    return image
}

func makeSymbolImageView(imageName: String, scale: SymbolScale = .large) -> UIImageView {
    let image = makeSymbolImage(imageName: imageName, scale: scale)
    return UIImageView(image: image)
}

func makeClearButton(withText text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    button.layer.cornerRadius = 40/2
    button.layer.borderWidth = 1.0
    
    button.setTitleColor(ColorCompatibility.label, for: .normal)
    button.layer.borderColor = ColorCompatibility.label.cgColor
    button.backgroundColor = ColorCompatibility.systemBackground
    
    return button
}

func makeNavigationController(rootViewController: UIViewController) -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: rootViewController)
    navigationController.navigationBar.prefersLargeTitles = true
    
    let attrs = [
        NSAttributedString.Key.foregroundColor: ColorCompatibility.label,
        NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1).bold()
    ]
    
    navigationController.navigationBar.largeTitleTextAttributes = attrs
    
    return navigationController
}
