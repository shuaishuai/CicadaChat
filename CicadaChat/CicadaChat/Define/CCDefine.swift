//
//  CCDefine.swift
//  CicadaChat
//
//  Created by Allen on 2016/12/28.
//  Copyright © 2016年 Allen. All rights reserved.
//

import Foundation
import UIKit

// MARK: - MainScreen

let MainScreen = UIScreen.main
let MainScreenBounds = MainScreen.bounds
let MainScreenWidth = MainScreenBounds.width
let MainScreenHeight = MainScreenBounds.height

// MARK: - UIView

extension UIView{
    var top:CGFloat {
        return self.frame.minX
    }
    
    var left:CGFloat{
        return self.frame.minY
    }
    
    var width:CGFloat{
        return self.frame.width
    }
    
    var height:CGFloat {
        return self.frame.height
    }
    
    var bottom:CGFloat{
        return top + height
    }
    
    var right:CGFloat{
        return left + width
    }
}

//MARK: - UIColor
//主色调灰色
var MainGrayColor:UIColor{
    return ColorWithHexValue(hexValue: 0x8a8a8a)
}
//主色调灰色
var MainPinkRed:UIColor{
    return ColorWithHexValue(hexValue: 0xd4237a)
}



func ColorWithRGBA(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) -> UIColor {
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
}

func ColorWithRGB(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
    return ColorWithRGBA(red: red, green: green, blue: blue, alpha: 1)
}

func ColorWithHexValue(hexValue:Int) -> UIColor {
    let red = (hexValue & 0xFF0000)>>16
    let green = (hexValue & 0xFF00)>>8
    let blue = (hexValue & 0xFF)
    return ColorWithRGB(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
}
