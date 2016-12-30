//
//  CCRootTabBarController.swift
//  CicadaChat
//
//  Created by Allen on 2016/12/28.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit

class CCRootTabBarController: UITabBarController {

    let customTabbar:CCTabbar = CCTabbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setTabbar()
        setChildController()
    }
    
    func setTabbar() {
        self.tabBar.isHidden = true
        customTabbar.frame = CGRect(x: 0, y: MainScreenHeight - 49, width: MainScreenWidth, height: 49)
        customTabbar.backgroundColor = UIColor.white
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 0.5))
        lineView.backgroundColor = UIColor(white: 0.3, alpha: 0.2)
        customTabbar.addSubview(lineView)
        
        self.view.addSubview(customTabbar)
    }
    
    func setChildController() {
        let controllers = [CCChatViewController(),CCAddressBookController(),CCFriendCircleController(),CCMeViewController()]
        let imageNames = ["chat","addressBook","friendCircle","me"]
        let titles = ["聊天","通讯录","圈子","我的"]
        var childContrllers:Array<UINavigationController> = []
        for element in controllers.enumerated() {
            let title = titles[element.offset]
            let imageName = imageNames[element.offset]
            customTabbar.addBarItem(title: title, imageName: imageName)
            let controller = controllers[element.offset]
            let nav = UINavigationController(rootViewController: controller)
            childContrllers.append(nav)
        }
        self.viewControllers = childContrllers
    }
}
