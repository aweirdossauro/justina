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
    
    var rect : CGRect {
        get {
            let f = self.frame
            let rect = CGRect(x: f.minX, y: f.minY, width: f.width, height: f.height)
            return rect
        }
    }
    
    func roundCorners(corners: UIRectCorner = [.topLeft, .bottomLeft, .topRight, .bottomRight], radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func roundCorners(topLeft: CGFloat = 0, topRight: CGFloat = 0, bottomLeft: CGFloat = 0, bottomRight: CGFloat = 0) {
        let minX = bounds.minX
        let minY = bounds.minY
        let maxX = bounds.maxX
        let maxY = bounds.maxY

        let path = UIBezierPath()
        path.move(to: CGPoint(x: minX + topLeft, y: minY))
        path.addLine(to: CGPoint(x: maxX - topRight, y: minY))
        path.addArc(withCenter: CGPoint(x: maxX - topRight, y: minY + topRight), radius: topRight, startAngle:CGFloat(3 * Double.pi / 2), endAngle: 0, clockwise: true)
        path.addLine(to: CGPoint(x: maxX, y: maxY - bottomRight))
        path.addArc(withCenter: CGPoint(x: maxX - bottomRight, y: maxY - bottomRight), radius: bottomRight, startAngle: 0, endAngle: CGFloat(Double.pi / 2), clockwise: true)
        path.addLine(to: CGPoint(x: minX + bottomLeft, y: maxY))
        path.addArc(withCenter: CGPoint(x: minX + bottomLeft, y: maxY - bottomLeft), radius: bottomLeft, startAngle: CGFloat(Double.pi / 2), endAngle: CGFloat(Double.pi), clockwise: true)
        path.addLine(to: CGPoint(x: minX, y: minY + topLeft))
        path.addArc(withCenter: CGPoint(x: minX + topLeft, y: minY + topLeft), radius: topLeft, startAngle: CGFloat(Double.pi), endAngle: CGFloat(3 * Double.pi / 2), clockwise: true)
        path.close()

        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func installShadow() {
        layer.cornerRadius = 2
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.45
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowRadius = 1.0
    }
    
}


