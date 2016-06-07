//
//  TabBarController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/4.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCustomNavigationController(ToolsViewController(), title: "娱乐", imgName: "tabbar_home")
        
        addCustomNavigationController(ToolsViewController(), title: "生活", imgName:"tabbar_home")
        
        addCustomNavigationController(ToolsViewController(), title: "医疗", imgName: "tabbar_home")
        
        addCustomNavigationController(ToolsViewController(), title: "工具", imgName:"tabbar_home")
        
        // Do any additional setup after loading the view.
    }


    
    func addCustomNavigationController(navVc:UIViewController,title:String,imgName:String){

        navVc.title = title
        
        navVc.tabBarItem.image = UIImage(named: imgName)
        
        navVc.tabBarItem.selectedImage = UIImage(named: imgName+"_selected")
        
        self.tabBar.tintColor = UIColor .orangeColor()
        
        let naviController = UINavigationController(rootViewController: navVc)
        
        naviController.navigationBar.translucent = false;
        
        addChildViewController(naviController)
        
        
    }

}
