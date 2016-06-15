//
//  ZBHomePageViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/8.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class ZBHomePageViewController: UIViewController{
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "日常生活"
        
        let tableView = UITableView.init(frame: CGRectMake(0, 0, SCREEN_W, SCREEN_H-64-49))
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        
        tableView.registerNib(UINib(nibName:"DailyTableViewCell",bundle: nil), forCellReuseIdentifier: "DailyTableViewCell")
        
        tableView.registerNib(UINib(nibName:"JokeTableViewCell",bundle: nil), forCellReuseIdentifier: "JokeTableViewCell")
        
        tableView.registerNib(UINib(nibName:"FirstTableViewCell",bundle: nil), forCellReuseIdentifier: "FirstTableViewCell")
        
       
        
        creatUI()
        
    }
    
    func creatUI(){
        
      
    }
 
    
}


//MARK:tableViewDataSource
extension ZBHomePageViewController:UITableViewDelegate,UITableViewDataSource
{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        if(indexPath.section == 0){
            
            return 150
            
        }else if (indexPath.section == 1){
            
            return 200
            
        }
        //笑话高度
        return 160;
        
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if(section == 0){
            
            return 0.1
            
        }
        
        return 10
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if(indexPath.section == 0){
            //加一张图片
            let cell = tableView.dequeueReusableCellWithIdentifier("FirstTableViewCell") as! FirstTableViewCell
            
            return cell
            
        }else if (indexPath.section == 1){
            //日常快捷入口
            
        let cell = tableView.dequeueReusableCellWithIdentifier("DailyTableViewCell") as! DailyTableViewCell
            
            return cell
        }
            //笑话
            let cell1 = tableView.dequeueReusableCellWithIdentifier("JokeTableViewCell") as! JokeTableViewCell
            
            return cell1
    }

}



