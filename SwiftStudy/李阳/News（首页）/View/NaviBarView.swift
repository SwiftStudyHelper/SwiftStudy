//
//  NaviBarView.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/13.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class NaviBarView: UIView {
    
    let btnWidth:CGFloat = 50
    
    var titleBarScrollView:UIScrollView = UIScrollView()
    
    var redView:UIView = UIView()
    
    let titles = ["头条","国际","科技","体育","苹果","社会","美女","段子"]
    
    //重载父类的init方法
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        createSubViews()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubViews() {
        
        self.backgroundColor = RGBA(251, G: 251, B: 251, A: 1)
        
        

        self.titleBarScrollView.frame = CGRectMake(12, 2, SCREEN_W-24, 42)
        
        self.titleBarScrollView.backgroundColor = UIColor.clearColor()
        
        self.titleBarScrollView.contentSize = CGSizeMake(btnWidth*8, 42)
        
        self.addSubview(self.titleBarScrollView)
        
        for i in 0 ..< 8 {
            
            let btn:UIButton = UIButton(type:.Custom)
            
            btn.frame = CGRectMake(CGFloat(Float(i))*btnWidth, 0, btnWidth, 40)
            
            btn.setTitle(titles[i], forState: UIControlState.Normal)
            
            btn.setTitleColor(RGBA(154, G: 154, B: 154, A: 1), forState: UIControlState.Normal)
            self.titleBarScrollView.addSubview(btn)
        }
        
        redView.frame = CGRectMake(0, 40, btnWidth, 2)
        
        redView.backgroundColor = UIColor.redColor()
        
        self.titleBarScrollView.addSubview(redView)
        
        
    }

}
