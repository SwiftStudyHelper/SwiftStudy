//
//  TXWeatherDetailCell.swift
//  SwiftStudy         //
//  Created by l2cplat on 16/6/14.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class TXWeatherDetailCell: UITableViewCell {
    
    var city:UILabel!
    var time:UILabel!
    var weather:UILabel!
    var weatherImage:UIImageView!
    var fl:UILabel!
    var hum:UILabel!
    var pcpn:UILabel!
    var pres:UILabel!
    var tmp:UILabel!
    var vis:UILabel!
    var windDeg:UILabel!
    var windDir:UILabel!
    var windSc:UILabel!
    var windSpd:UILabel!
    var airAqi:UILabel!
    var airQlty:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.cyanColor()
        self.backgroundView = UIImageView(image:UIImage(named:"cellBackView"))
        city = UILabel(frame: CGRectMake(SCREEN_W / 2 - 50 , 150, 100, 50))
        city.backgroundColor = UIColor.clearColor()
        city.text = "西安市"
        city.font = UIFont.systemFontOfSize(23);
        city.textAlignment = NSTextAlignment.Center
        self.addSubview(city)
        
        
        weatherImage = UIImageView(frame: CGRectMake(100, 100, 50, 50))
        weatherImage.image = UIImage(named:"w0")
        self.addSubview(weatherImage)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}