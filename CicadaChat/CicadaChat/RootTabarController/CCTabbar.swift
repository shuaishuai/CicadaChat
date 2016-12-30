//
//  CCTabbar.swift
//  CicadaChat
//
//  Created by Allen on 2016/12/29.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit

class CCTabbar: UIView {
    var selectIndex = 0
    var buttonItems:[CCButton] = []
    weak var delegate:CCTabbarDelegate?
    
    func addBarItem(title:String,imageName:String) {
        let barItem = CCButton(direction: .CCButtonDirectionVertical)
        barItem.setTitle(title, for: .normal)
        barItem.setTitleColor(MainGrayColor, for: .normal)
        barItem.setTitleColor(MainPinkRed, for: .selected)
        let normalImage = UIImage(named: imageName)
        let selectedImage = UIImage(named: imageName.appending("_select"))
        barItem.setImage(normalImage, for: .normal)
        barItem.setImage(selectedImage, for: .selected)
        barItem.addTarget(self, action: #selector(CCTabbar.barItemClick(barItem:)), for: .touchUpInside)
        buttonItems.append(barItem)
        barItem.tag = buttonItems.count - 1
        addSubview(barItem)
        if buttonItems.count-1 == selectIndex {
            barItem.isSelected = true
        }
        setNeedsLayout()
    }
    
    func barItemClick(barItem:CCButton) {
        let currentButton = buttonItems[selectIndex]
        currentButton.isSelected = false
        barItem.isSelected = true
        if let delegate = delegate {
            delegate.tabbar(tabbar: self, didSelectItemFrom: selectIndex, to: barItem.tag)
        }
        selectIndex = barItem.tag
    }
    
    override func layoutSubviews() {
        let barItemCount = buttonItems.count
        let itemWidth = MainScreenWidth/CGFloat(barItemCount)
        for barItemElement in buttonItems.enumerated() {
            barItemElement.element.frame = CGRect(x: itemWidth * CGFloat(barItemElement.offset), y: 0, width: itemWidth, height: 49)
        }
    }
}


protocol CCTabbarDelegate:NSObjectProtocol {
    func tabbar(tabbar:CCTabbar,didSelectItemFrom:Int, to:Int)
}
