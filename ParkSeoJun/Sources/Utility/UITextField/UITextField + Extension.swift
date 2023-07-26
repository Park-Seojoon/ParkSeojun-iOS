//
//  UITextField + Extension.swift
//  ParkSeoJun
//
//  Created by 신아인 on 2023/07/26.
//

import UIKit

extension UITextField {
//    func addUnderline() {
//        let underline = CALayer()
//        underline.backgroundColor = UIColor.black.cgColor
//        underline.frame = CGRect(x: 0, y: self.bounds.height - 1, width: self.bounds.width, height: 1)
//        self.layer.addSublayer(underline)
//    }
    
    func addUnderline(with color: UIColor = .lightGray, height: CGFloat = 1.0) {
        let underline = CALayer()
        underline.backgroundColor = color.cgColor
        underline.frame = CGRect(x: 0, y: self.bounds.height - height, width: self.bounds.width, height: height)
        self.layer.addSublayer(underline)
    }
}
