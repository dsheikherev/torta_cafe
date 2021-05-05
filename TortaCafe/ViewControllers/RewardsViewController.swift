//
//  RewardsViewController.swift
//  TortaCafe
//
//  Created by Denis Sheikherev on 05.05.2021.
//

import UIKit

class RewardsViewController: UIViewController {
    
    let rewardsTileView = RewardsTileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviewsUsingAutoLayout(rewardsTileView)
        
        NSLayoutConstraint.activate([
            rewardsTileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rewardsTileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardsTileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardsTileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
