//
//  StarAndPointsView.swift
//  TortaCafe
//
//  Created by Denis Sheikherev on 05.05.2021.
//

import UIKit

class StarAndPointsView: UIView {
    
    let pointsLabel = UILabel()
    let starView = makeSymbolImageView(imageName: "star.fill", scale: .small)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        pointsLabel.font = UIFont.preferredFont(forTextStyle: .callout).bold()
        pointsLabel.textAlignment = .right
        
        starView.tintColor = .starYellow
        starView.contentMode = .scaleAspectFit
    }
    
    func layout() {
        addSubviewsUsingAutoLayout(pointsLabel, starView)
        
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            pointsLabel.trailingAnchor.constraint(equalTo: starView.leadingAnchor, constant: -2),
            pointsLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            starView.trailingAnchor.constraint(equalTo: trailingAnchor),
            starView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 60, height: 16)
    }
}


