//
//  UIViewExtensions.swift
//  D&DCharManagerMVVM
//
//  Created by Egor on 08.05.2021.
//

import UIKit

public extension UIView {
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
