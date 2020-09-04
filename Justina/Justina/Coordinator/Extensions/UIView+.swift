//
//  UIView+.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 04/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

extension UIView{
    func roundCorners(corners: UIRectCorner, radius: CGFloat, rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
