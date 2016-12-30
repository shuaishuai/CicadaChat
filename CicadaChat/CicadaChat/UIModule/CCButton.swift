//
//  CCButton.swift
//  CicadaChat
//
//  Created by Allen on 2016/12/28.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit


class CCButton: UIButton {
    enum CCButtonDirection:Int {
        case CCButtonDirectionHorizontal = 1
        case CCButtonDirectionVertical
    }
    private var direction : CCButtonDirection
    var imageRatio:CGFloat = 0.7{
        didSet{
            if (imageRatio > 1) || (imageRatio < 0) {
                imageRatio = 0.7
            }
            setNeedsLayout()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(direction: CCButtonDirection) {
        self.direction = direction
        super.init(frame: CGRect.zero)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.imageView?.contentMode = .center
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        switch direction {
        case .CCButtonDirectionHorizontal:
            return CGRect(x: 2, y: 0, width: contentRect.width *  imageRatio, height: contentRect.height)
        case .CCButtonDirectionVertical:
            return CGRect(x: 0, y: 2, width: contentRect.width , height: contentRect.height *  imageRatio)
        }
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        switch direction {
        case .CCButtonDirectionHorizontal:
            return CGRect(x:contentRect.width * imageRatio , y: 0, width: contentRect.width * (1-imageRatio), height:contentRect.height)
        case .CCButtonDirectionVertical:
            return CGRect(x:0 , y: contentRect.height * imageRatio, width: contentRect.width , height:contentRect.height * (1-imageRatio))
        }
    }
}
