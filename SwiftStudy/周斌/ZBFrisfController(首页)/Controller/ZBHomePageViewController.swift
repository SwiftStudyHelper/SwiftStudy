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
        
        let tableView = UITableView.init(frame: CGRectMake(0, 0, SCREEN_W, SCREEN_H-64-49))
        
        let image = UIImage (named: "l2cplatLogo.png")
        
        let vImg = UIImageView(image: image);
        
        self.view.addSubview(tableView)
        
        tableView.addSubview(vImg)
        
        //这里放button
        let imageViewBtn = UIImageView.init(frame: CGRectMake(0, 180, SCREEN_W, 180))
        
        imageViewBtn.backgroundColor = UIColor.lightGrayColor()
        
        tableView.addSubview(imageViewBtn)
        
        
        //这里放每日分享
        
        let imageView1 = UIImageView.init(frame: CGRectMake(0, 370, SCREEN_W, 250))
        
        imageViewBtn.backgroundColor = UIColor.lightGrayColor()
        
//        imageView1.backgroundColor =  UIColor.cyanColor()
        
        tableView.addSubview(imageView1)
        
        let label = UILabel.init(frame: CGRectMake(8, 8, SCREEN_W-10, 20))
        
        label.text = "妞 , 给 大 爷 笑 一 个 :"
        
        label.textColor = UIColor.redColor()
        
        label.font = UIFont.systemFontOfSize(17)
        
        imageView1.addSubview(label)
        
        let contentLabel = UILabel.init(frame: CGRectMake(20, 0, SCREEN_W-34, 150))

//        contentLabel.backgroundColor = UIColor.lightGrayColor()
        
        contentLabel.textColor = UIColor.blackColor()
        
        contentLabel.font = UIFont.systemFontOfSize(15)
        
        contentLabel.numberOfLines = 0
        
        contentLabel.text = " 儿子中考考试考差了，被老婆骂了一顿。 我去安慰儿子：“你要努力学习,以后一定要超越爸爸”  儿子愣了一下,弱弱的来了一句：“别的我不敢保证，但是以后找个比你好的老婆还是很有把握的” "
        
        imageView1.addSubview(contentLabel)
        
        
    }
    
}
