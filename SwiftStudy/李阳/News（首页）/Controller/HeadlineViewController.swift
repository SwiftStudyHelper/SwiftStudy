//
//  HeadlineViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/13.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class HeadlineViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var HeadlineTableView:UITableView?
    var page:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CreatUI()
        
    }

    //MARK:-初始化控件
    func CreatUI(){
        
        self.HeadlineTableView? = UITableView(frame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-Navi_H-Bar_H))
        
        HeadlineTableView?.delegate = self
        
        HeadlineTableView?.dataSource  = self
        
        
        
        
        
    }
    
    //MARK:-网络请求
    func getDataFromNetWork()
    {
        let dic:Dictionary<String,AnyObject>  = ["id":"popular","page":page]
        
        AMFHelper .BaiduGet(baiduNewsTouTiaoUrl, parameters: dic, success: { (responseObject) in
            
            
            
            }) { (error) in
            
            print(error)
                
        }
    }
    
    //MARK:-tableView代理方法

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        
        return cell
    }


    
}
