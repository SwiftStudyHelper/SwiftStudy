//
//  CalculateTimeHelper.swift
//  SwiftStudy
//
//  Created by l2cplat on 16/6/14.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class CalculateTimeHelper: NSObject {
    

    class func calculateTimeWithInterval(interval:NSInteger)->String {
        
        //把时间戳转化成日期
        
         let timeDate = NSDate.init(timeIntervalSince1970: (Double)(interval))
   
        //获取现在时间
         let  currentTime = NSDate()
        
        //获取日历
         let calendar = NSCalendar.currentCalendar()
        
        //创建 NSDateComponents
         let comps  = calendar.components([NSCalendarUnit.Month,NSCalendarUnit.Day,NSCalendarUnit.Hour,NSCalendarUnit.Minute], fromDate: timeDate, toDate: currentTime, options: NSCalendarOptions.WrapComponents)
        
        if comps.month > 0 {
            
           return String(comps.month) + "月前"
        } else if comps.day > 0 {
        
            return String(comps.day) + "天前"
        
        } else if comps.hour > 0 {
        
           
            return String(comps.hour) + "小时前"
        
        } else if comps.minute > 0 {
        
           return String(comps.minute) + "分钟前"
        
        } else {
        
          return "刚刚"
        }

        
    }
    
    
    

}
