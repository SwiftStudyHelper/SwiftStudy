//
//  LYHomePageViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/8.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class LYHomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellowColor()
        
        
//        var dic = NSMutableDictionary()
//        
//        dic .setValue("popular", forKey: "id")
//        
//        dic.setValue("1", forKey: "page")
        
        let dic = ["id":"popular","page":"1"]
        
        AMFHelper .BaiduGet(baiduNewsTouTiaoUrl, parameters: dic, success: { (responseObject) in
            
            print(responseObject)
            
            }) { (error) in
                
                print(error)
                
        }
        // Do any additional setup after loading the view.
        
    }
    

        

   


}
