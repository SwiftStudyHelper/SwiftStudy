//
//  JokeViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/15.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

import SwiftyJSON

import MJRefresh

class JokeViewController: UIViewController {
    
    var tableView:UITableView?
    
    var dataSource:NSMutableArray? = NSMutableArray()
    
    var page = 1

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func createUI() {
        
        tableView = UITableView(frame: CGRectMake(SCREEN_W*7, 0, SCREEN_W, SCREEN_H-Navi_H-Bar_H))
        
        tableView?.delegate = self
        
        tableView?.dataSource  = self
        
        tableView?.registerNib(UINib(nibName: "JokeTableViewCell", bundle: nil), forCellReuseIdentifier: "JokeTableViewCell")
        
    }
    
    func getDataFromNetwork(){
        
        let dic = ["page":String(page)]
        
        AMFHelper .BaiduGet(baiduJokeUrl, parameters: dic, success: { (responseObject) in
            
            print(responseObject)
            
            let dic = JSON(responseObject)
            
            let arr =  dic["showapi_res_body"]["contentlist"].array!
            
            for joke in arr
            {
                let model = JokeModel()
                
                model.setValuesForKeysWithDictionary(joke.dictionaryObject!)
                
                self.dataSource?.addObject(model)
            }
            
            dispatch_async(dispatch_get_main_queue(), { 
                
                self.tableView?.reloadData()
            })
            
            
            }) { (error) in
                
             print(error)
                
        }
        
    }
    
    
}

extension JokeViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (dataSource?.count)!
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = (tableView.dequeueReusableCellWithIdentifier("JokeTableViewCell", forIndexPath: indexPath) as! JokeTableViewCell)
        
        cell.refreshCellWithModel(self.dataSource![indexPath.row] as! JokeModel)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let str:NSString = (self.dataSource![indexPath.row] as! JokeModel).text!
        
        var changeStr:NSString?
        do{
            let attrStr = try NSAttributedString(data: str.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
            
           changeStr = (attrStr.string as NSString)
            
        }catch let error as NSError {
            
            print(error.localizedDescription)
        }

        
        let constraintSize:CGSize =  CGSizeMake(SCREEN_W-16, CGFloat(MAXFLOAT));
        
        let size:CGSize = changeStr!.boundingRectWithSize(constraintSize, options: [NSStringDrawingOptions.UsesLineFragmentOrigin,NSStringDrawingOptions.UsesFontLeading,NSStringDrawingOptions.UsesDeviceMetrics,NSStringDrawingOptions.TruncatesLastVisibleLine],attributes: [NSFontAttributeName:UIFont.systemFontOfSize(14)], context: nil).size
        
        return size.height+80
        
    }



    
}
