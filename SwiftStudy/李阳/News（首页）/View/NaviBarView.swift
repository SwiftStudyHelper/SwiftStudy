//
//  NaviBarView.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/13.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class NaviBarView: UIView {
    
    var titleBarScrollView:UIScrollView = UIScrollView()
    
    //重载父类的init方法
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.titleBarScrollView.frame = CGRectMake(12, 2, SCREEN_W-24, 40)
        
        self.titleBarScrollView.backgroundColor = RGBA(164, G:164 , B: 164, A: 1)
        
        self.addSubview(self.titleBarScrollView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
