//
//  ZBHomePageViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/8.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class ZBHomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "日常生活"
        
        creatUI()
        
    }

    func creatUI(){
        
        let image = UIImage (named: "jiankang.jpg")
        
        let imageView = UIImageView.init(frame: CGRectMake(0, 0, SCREEN_W, 150))
        
        var vImg = UIImageView(image: image);

        self.view .addSubview(vImg)
                
        
    }


}
