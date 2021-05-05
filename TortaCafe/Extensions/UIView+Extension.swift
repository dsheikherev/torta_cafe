//
//  UIView+Extension.swift
//  TortaCafe
//
//  Created by Denis Sheikherev on 05.05.2021.
//

import UIKit

extension UIView {
    func addSubviewsUsingAutoLayout(_ views: UIView ...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}
