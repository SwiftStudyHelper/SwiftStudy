//
//  LYHomePageViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/8.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class LYHomePageViewController: UIViewController {
    
    var barView:NaviBarView? = NaviBarView()
    
    var newsScrollView:UIScrollView? = UIScrollView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellowColor()
        
        
        createUI()
    }
    

    func createUI(){
        
        self.navigationController?.navigationBar.hidden = true;
        
        barView?.frame = CGRectMake(0, 20, SCREEN_W, 44)
        
        self.view.addSubview(barView!)
        
        newsScrollView?.frame = CGRectMake(0, 64, SCREEN_W, SCREEN_H-Navi_H-Bar_H)
        
        newsScrollView?.contentSize = CGSizeMake(SCREEN_W*5, SCREEN_H-Navi_H-Bar_H)
        
        newsScrollView?.pagingEnabled = true
        
        newsScrollView?.backgroundColor = RGBA(0, G: 255, B: 255, A: 0.5)
        
        self.view.addSubview(newsScrollView!)
        
    }

   


}
