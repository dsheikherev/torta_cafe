//
//  HomeHeaderView.swift
//  TortaCafe
//
//  Created by Denis Sheikherev on 04.05.2021.
//

import ColorCompatibility
import UIKit

class HomeHeaderView: UIView {
    
    let greetings = UILabel()
    var ordersHistoryButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        ordersHistoryButton = makeHeaderButton(withImage: "calendar", title: "Your orders")
        ordersHistoryButton.addTarget(self, action: #selector(historyButtonTapped), for: .primaryActionTriggered)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeHeaderButton(withImage name: String, title: String) -> UIButton {
        let button = UIButton()
        
        let image = makeSymbolImage(imageName: name)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = ColorCompatibility.secondaryLabel
        button.imageView?.contentMode = .scaleAspectFit
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(ColorCompatibility.secondaryLabel, for: .normal)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return button
    }
    
    func style() {
        backgroundColor = ColorCompatibility.systemBackground
        
        greetings.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greetings.text = "Good morning, Denis ☀️"
        greetings.numberOfLines = 0
        greetings.lineBreakMode = .byWordWrapping
    }
    
    func layout() {
        addSubviewsUsingAutoLayout(greetings, ordersHistoryButton)
        
        NSLayoutConstraint.activate([
            greetings.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            greetings.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: greetings.trailingAnchor, multiplier: 2),
            
            ordersHistoryButton.topAnchor.constraint(equalToSystemSpacingBelow: greetings.bottomAnchor, multiplier: 2),
            ordersHistoryButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: ordersHistoryButton.bottomAnchor, multiplier: 1)
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    @objc func historyButtonTapped() {
        
    }
}
