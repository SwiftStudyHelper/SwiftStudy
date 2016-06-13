//
//  HeadlineViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/13.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

import SwiftyJSON

protocol HeadlineViewControllerDelegate:NSObjectProtocol {
    
    func clickTheCellWithIndexPath(url:String)
    
}


class HeadlineViewController: UIViewController{
    
    var dataSource:Array<HLModel> = []
    
    var HeadlineTableView:UITableView?
    
    var page:Int = 1
    
    weak var delegate: HeadlineViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    


    //MARK:-初始化控件
    func CreatUI(){
        
        self.HeadlineTableView = UITableView(frame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-Navi_H-Bar_H))
        
        self.HeadlineTableView?.backgroundView?.backgroundColor = UIColor.purpleColor()
        
        self.HeadlineTableView!.delegate = self
        
        self.HeadlineTableView!.dataSource  = self
        
        self.HeadlineTableView!.registerNib(UINib(nibName: "NewsCommTableViewCell",bundle: nil), forCellReuseIdentifier: "NewsCommTableViewCell")
        
    }
    
    //MARK:-网络请求
    func getDataFromNetWork()
    {
        let dic:Dictionary<String,AnyObject>  = ["id":"popular","page":page]
        
        AMFHelper .BaiduGet(baiduNewsTouTiaoUrl, parameters: dic, success: { (responseObject) in
            
            print(responseObject)
            
            let result = JSON(responseObject)
            
            let arr = result["data"]["article"].array!
            
            for dic in arr{
                
                let model = HLModel()
                
                model.setValuesForKeysWithDictionary(dic.dictionaryObject!)
                
                self.dataSource.append(model)
            }
            
            dispatch_async(dispatch_get_main_queue(), { 
                
                self.HeadlineTableView!.reloadData()
            })
            
            }) { (error) in
            
            print(error)
                
        }
    }
    


   
}



extension HeadlineViewController:UITableViewDelegate,UITableViewDataSource
{
    //MARK:-tableView代理方法
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCommTableViewCell") as! NewsCommTableViewCell
        
        cell.refreshCellWithModel(self.dataSource[indexPath.row])
        
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        
        return 80
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        self.delegate?.clickTheCellWithIndexPath(self.dataSource[indexPath.row].url!)
    }

    
}
