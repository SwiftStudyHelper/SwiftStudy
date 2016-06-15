//
//  MyCustomButton.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/15.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class MyCustomButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.imageView?.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-20)
        
        self.titleLabel?.frame = CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 20)
        
    }
    

}
