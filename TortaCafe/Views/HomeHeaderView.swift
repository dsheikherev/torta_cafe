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
    let inboxButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        greetings.translatesAutoresizingMaskIntoConstraints = false
        greetings.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greetings.text = "Good morning, Denis ☀️"
        greetings.numberOfLines = 0
        greetings.lineBreakMode = .byWordWrapping
        
        inboxButton.translatesAutoresizingMaskIntoConstraints = false
        inboxButton.setTitleColor(ColorCompatibility.label, for: .normal)
        inboxButton.setTitle("Inbox", for: .normal)
    }
    
    func layout() {
        addSubview(greetings)
        addSubview(inboxButton)
        
        NSLayoutConstraint.activate([
            greetings.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            greetings.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: greetings.trailingAnchor, multiplier: 2),
            
            inboxButton.topAnchor.constraint(equalToSystemSpacingBelow: greetings.bottomAnchor, multiplier: 2),
            inboxButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: inboxButton.bottomAnchor, multiplier: 1)
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
}
