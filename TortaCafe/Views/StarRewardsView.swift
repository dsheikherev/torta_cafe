//
//  StarRewardsView.swift
//  TortaCafe
//
//  Created by Denis Sheikherev on 05.05.2021.
//

import ColorCompatibility
import UIKit

class StarRewardsView: UIView {
    
    let stackView = UIStackView()
    let label = UILabel()
    
    struct Reward {
        let numberOfPoints: String
        let description: String
    }
    
    var rewards: [Reward] =
        [Reward(numberOfPoints: "25", description: "Add topping to your coffee"),
         Reward(numberOfPoints: "50", description: "A cup of coffee + Bakery item"),
         Reward(numberOfPoints: "150", description: "Breakfast porridge + Bakery item"),
         Reward(numberOfPoints: "250", description: "A big cup of coffee + Lunch sandwich"),
         Reward(numberOfPoints: "400", description: "Whole breakfast"),
        ]
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        backgroundColor = ColorCompatibility.systemFill
        layer.cornerRadius = 10
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 26
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: -16)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        label.text = "Rewards you can get with Stars"
    }
    
    private func layout() {
        stackView.addArrangedSubview(label)
        
        for reward in rewards {
            stackView.addArrangedSubview(StarRewardsRow(numberOfPoints: reward.numberOfPoints, description: reward.description))
        }
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
