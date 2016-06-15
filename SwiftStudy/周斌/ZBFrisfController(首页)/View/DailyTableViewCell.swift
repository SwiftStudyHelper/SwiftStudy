//
//  DailyTableViewCell.swift
//  SwiftStudy
//
//  Created by feaonline on 16/6/15.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

protocol  buttonTableViewDelegate:NSObjectProtocol{
    

}

class DailyTableViewCell: UITableViewCell {
//快递
    @IBAction func searchCourier(sender: UIButton) {
        
//        buttonTableViewDelegate
    }
//体育新闻
    
    @IBAction func sportNews(sender: UIButton) {
    }

//健康
    
    @IBAction func healthInformation(sender: UIButton) {
    }
    
//违章
    
    @IBAction func searchIllegal(sender: UIButton) {
    }
    
//苹果
    
    @IBAction func appleNews(sender: UIButton) {
    }

//星座
    
    @IBAction func constellation(sender: UIButton) {
    }
    
//汇率
    
    @IBAction func change(sender: UIButton) {
    }
    
//天气
    
    @IBAction func searchWeather(sender: UIButton) {
    }

}
