//
//  UIColor+.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 12/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

extension UIColor {
    /// init
    ///
    /// - Parameter hexString: String
    convenience init(hexString: String) {
        let scanner = Scanner(string: hexString.replacingOccurrences(of: "#", with: ""))
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }

    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
    
    /// secondary background color
    @objc class var secondaryBackground: UIColor {
        return .systemGray4
    }
    
    /// primary background color
    @objc class var primaryBackground: UIColor {
        return .systemGray6
    }

    /// background de mensagens da justina
    @objc class var justinaBackground: UIColor {
        return .systemGray6
    }

    /// background de mensagens do usuario #0095C3
    @objc class var userMessagesBackground: UIColor {
        return UIColor(red: 0.0 / 255.0, green: 149.0 / 255.0, blue: 195.0 / 255.0, alpha: 1.0)
    }
    
    /// background padrão dos buttons #5E82E4
    @objc class var buttonBackground: UIColor {
        return UIColor(hexString: "#5E82E4")
    }
    
}
