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
        
        
        addCustomNavigationController(ToolsViewController(), title: "首页", imgName: "tabbar_home")
        
        addCustomNavigationController(ToolsViewController(), title: "新闻", imgName:"tabbar_home")
        
        addCustomNavigationController(ToolsViewController(), title: "医疗", imgName: "tabbar_home")
        
        addCustomNavigationController(ToolsViewController(), title: "工具", imgName:"tabbar_home")
        
        // Do any additional setup after loading the view.
    }


    
    func addCustomNavigationController(navVc:UIViewController,title:String,imgName:String){
        
        navVc.title = title
        
        navVc.tabBarItem.image = UIImage(named: imgName)
        
        navVc.tabBarItem.selectedImage = UIImage(named: imgName+"_highlighted")
        
        let naviController = UINavigationController(rootViewController: navVc)
        
        addChildViewController(naviController)
        
        
    }

}
