//
//  HSI.swift
//  
//
//  Created by 黄品源 on 2022/9/5.
//

import Foundation
import UIKit

public struct HSI {
    public var h = 0.0
    public var s = 0.0
    public var i = 0.0
    public var a = 0.0
    
    public init(h: CGFloat, s:CGFloat, i:CGFloat, a:CGFloat) {
        self.h = h
        self.s = s
        self.i = i
    }
    
    public init(h: CGFloat, s: CGFloat, i: CGFloat) {
        self.init(h: h, s: s, i: i, a: 1.0)
    }
}

extension UIColor {
    
   public class func getHSIColorWithRGB(rgbColor: UIColor) -> HSI {
        
        var r : CGFloat = 0.0
        var g : CGFloat = 0.0
        var b : CGFloat = 0.0
        var a : CGFloat = 0.0
        
        rgbColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        
    
        
        var hsi = HSI(h: 0, s: 0, i: 0)
        var temp = sqrt((r-g)*(r-g)+(r-b)*(g-b))
        temp = temp > 0 ? temp : 0.01
        if (b <= g){
            hsi.h = acos(((r-g+r-b)/2.0)/temp)
        }   else{
            hsi.h = 2*Double.pi - acos(((r-g+r-b)/2.0)/temp)
        }
        temp = r+g+b > 0 ? r+g+b : 0.01
        hsi.s = 1.0 - (3.0/temp) * min(r, g, b)
        hsi.i = (r+g+b)/3.0
        return hsi
    }
    
}
