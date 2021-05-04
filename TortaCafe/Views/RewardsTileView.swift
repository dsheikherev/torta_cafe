//
//  RewardsTileView.swift
//  TortaCafe
//
//  Created by Denis Sheikherev on 05.05.2021.
//

import ColorCompatibility
import UIKit

class RewardsTileView: UIView {
    
    let balanceView = BalanceView()
    let rewardsGraphView = RewardsGraphView()
    let starRewardsView = StarRewardsView()
    var rewardsButton = UIButton()
    var detailsButton = UIButton()
    
    var heightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Redraw our graph once we know our actual device width & height
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rewardsGraphView.actualFrameWidth = frame.width
        rewardsGraphView.drawRewardsGraph()
    }
    
    func layout() {
        addSubview(balanceView)
        addSubview(rewardsButton)
        addSubview(rewardsGraphView)
        addSubview(starRewardsView)
        addSubview(detailsButton)
        
        heightConstraint = starRewardsView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            rewardsButton.centerYAnchor.constraint(equalTo: balanceView.pointsLabel.centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rewardsButton.trailingAnchor, multiplier: 3),
            
            rewardsGraphView.topAnchor.constraint(equalToSystemSpacingBelow: balanceView.bottomAnchor, multiplier: 1),
            rewardsGraphView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rewardsGraphView.widthAnchor.constraint(equalToConstant: frame.width),
            
            starRewardsView.topAnchor.constraint(equalTo: rewardsGraphView.bottomAnchor, constant: 8),
            starRewardsView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: starRewardsView.trailingAnchor, multiplier: 1),
            heightConstraint!,
            
            detailsButton.topAnchor.constraint(equalToSystemSpacingBelow: starRewardsView.bottomAnchor, multiplier: 2),
            detailsButton.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor),
            bottomAnchor.constraint(equalToSystemSpacingBelow: detailsButton.bottomAnchor, multiplier: 2),
        ])
        
        starRewardsView.isHidden = true
    }
    
    func style() {
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        rewardsGraphView.translatesAutoresizingMaskIntoConstraints = false
        starRewardsView.translatesAutoresizingMaskIntoConstraints = false
        
        makeRewardsOptionButton()
        
        detailsButton = makeClearButton(withText: "Details")
        detailsButton.addTarget(self, action: #selector(detailsButtonTapped), for: .primaryActionTriggered)
    }
    
    func makeRewardsOptionButton() {
        rewardsButton.translatesAutoresizingMaskIntoConstraints = false
        rewardsButton.addTarget(self, action: #selector(rewardOptionsTapped), for: .primaryActionTriggered)
        
        let image = makeSymbolImage(imageName: "chevron.down", scale: .small)
        
        rewardsButton.setImage(image, for: .normal)
        rewardsButton.imageView?.tintColor = ColorCompatibility.label
        rewardsButton.imageView?.contentMode = .scaleAspectFit
        
        rewardsButton.setTitle("Rewards options", for: .normal)
        rewardsButton.setTitleColor(ColorCompatibility.label, for: .normal)
        rewardsButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        rewardsButton.semanticContentAttribute = .forceRightToLeft
        rewardsButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 0)
        rewardsButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
}

extension RewardsTileView {
    @objc func rewardOptionsTapped() {
        if heightConstraint?.constant == 0 {
            self.setChevronUp()
            
            let unhideAnimator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraint?.constant = 270
                self.layoutIfNeeded()
            }
            
            unhideAnimator.startAnimation()
            
            let alphaAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
                self.starRewardsView.isHidden = false
                self.starRewardsView.alpha = 1
            }
            
            alphaAnimator.startAnimation(afterDelay: 0.5)
            
        } else {
            self.setChevronDown()
            
            let hideAnimator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraint?.constant = 0
                self.starRewardsView.isHidden = true
                self.starRewardsView.alpha = 0
                self.layoutIfNeeded()
            }
            
            hideAnimator.startAnimation()
        }
    }
    
    @objc func detailsButtonTapped() {
        print("Details tapped!!!")
    }
    
    private func setChevronUp() {
        let image = makeSymbolImage(imageName: "chevron.up", scale: .small)
        rewardsButton.setImage(image, for: .normal)
    }
    
    private func setChevronDown() {
        let image = makeSymbolImage(imageName: "chevron.down", scale: .small)
        rewardsButton.setImage(image, for: .normal)
    }
}
