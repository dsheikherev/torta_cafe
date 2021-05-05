//
//  HomeViewController.swift
//  TortaCafe
//
//  Created by Denis Sheikherev on 04.05.2021.
//

import UIKit

class HomeViewController: BaseViewController {
    
    let headerView = HomeHeaderView()
    var headerViewTopConstraint: NSLayoutConstraint?
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let callUsFloatingButton = UIButton()
    
    struct CallUsFloatingButton {
        static let height: CGFloat = 60
        static let width: CGFloat = 170
    }
    
    let fakeText = ["Lorem ipsum dolor sit amet",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque massa lorem, egestas ut egestas ut, auctor a diam. Nam id mi feugiat, varius ante at, cursus leo."]
    
    lazy var tiles: [UIViewController] = { return [
        RewardsViewController(),
        TileViewController(title: fakeText[0],
                           subtitle: fakeText[1],
                           imageName: "ekler"),
        TileViewController(title: fakeText[0],
                           subtitle: fakeText[1],
                           imageName: "mango"),
        TileViewController(title: fakeText[0],
                           subtitle: fakeText[1],
                           imageName: "snickers"),
        
    ]}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
        setupScrollView()
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Home")
    }
    
    private func style() {
        callUsFloatingButton.setTitle("Call Us", for: .normal)
        callUsFloatingButton.setTitleColor(.white, for: .normal)
        callUsFloatingButton.titleLabel?.minimumScaleFactor = 0.5
        callUsFloatingButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        callUsFloatingButton.titleLabel?.adjustsFontSizeToFitWidth = true
        callUsFloatingButton.backgroundColor = .lightGreen
        callUsFloatingButton.layer.cornerRadius = CallUsFloatingButton.height / 2
    }
    
    private func layout() {
        stackView.axis = .vertical
        stackView.spacing = 8
        
        view.addSubviewsUsingAutoLayout(headerView, scrollView, callUsFloatingButton)
        
        scrollView.addSubviewsUsingAutoLayout(stackView)
        
        for tile in tiles {
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }
        
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            callUsFloatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            callUsFloatingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            callUsFloatingButton.widthAnchor.constraint(equalToConstant: CallUsFloatingButton.width),
            callUsFloatingButton.heightAnchor.constraint(equalToConstant: CallUsFloatingButton.height),
        ])
    }
    
    private func setupScrollView() {
        scrollView.delegate = self
    }
    
}

extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        let swipingDown = y <= 0
        let shouldSnap = y > 30
        let labelHeight = headerView.greetings.frame.height + 16
        
        UIView.animate(withDuration: 0.3) {
            self.headerView.greetings.alpha = swipingDown ? 1.0 : 0.0
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: []) {
            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
        }
    }
}
