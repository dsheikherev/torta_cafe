//
//  HomeViewController.swift
//  TortaCafe
//
//  Created by Denis Sheikherev on 04.05.2021.
//

import UIKit

class HomeViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavBar()
        setTabBarImage(imageName: "house.fill", title: "Home")
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good morning, Denis ☀️"
    }
    
}
