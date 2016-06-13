//
//  LYHomePageViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/8.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class LYHomePageViewController: UIViewController,UIScrollViewDelegate{
    
    
    
    var barView:NaviBarView? = NaviBarView()
    
    var newsScrollView:UIScrollView? = UIScrollView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createUI()
        
    }
    

    func createUI(){
        
        self.navigationController?.navigationBar.barTintColor = RGBA(251, G: 251, B: 251, A: 1)
        
        barView?.frame = CGRectMake(0, 0, SCREEN_W-24, 44)
        
        self.navigationItem.titleView = barView!
        
        newsScrollView?.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H-Navi_H-Bar_H)
        
        newsScrollView?.contentSize = CGSizeMake(SCREEN_W*8, SCREEN_H-Navi_H-Bar_H)
        
        newsScrollView?.pagingEnabled = true
        
        newsScrollView?.backgroundColor = RGBA(0, G: 255, B: 255, A: 0.5)
        
        newsScrollView?.delegate = self
        
        self.view.addSubview(newsScrollView!)
        
    }
    
    //MARK:-scrollView代理方法
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        let offsetPage = scrollView.contentOffset.x/SCREEN_W
        
        UIView.animateWithDuration(0.3) { 
            
            self.barView?.redView.frame = CGRectMake(offsetPage*50, 40, 50, 2)
        }
        
        self.barView?.redTitle(Int(offsetPage))
        
        
    }// any offset changes


   


}
