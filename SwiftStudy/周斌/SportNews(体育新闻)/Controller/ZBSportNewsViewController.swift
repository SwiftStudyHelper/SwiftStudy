//
//  ZBSportNewsViewController.swift
//  SwiftStudy
//
//  Created by feaonline on 16/6/16.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit
import SwiftyJSON

//protocol ZBSportNewsDelegate:NSObjectProtocol {
//    
//    func clickTheCellWithIndexPath(url:String)
//    
//}



class ZBSportNewsViewController: UIViewController {
    
    var num:NSNumber = 10
    
    var page:NSNumber = 1
    
    var tableView:UITableView?
    
//    weak var delegate: ZBSportNewsDelegate?
    
    var nsMuArray:Array<ZBSportNewsModel> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        creatUI()
        
        creatGet()

    }

    func creatUI()
    {
        self.navigationItem.title = "体育新闻"
        
        tableView = UITableView.init(frame: CGRectMake(0, 0, SCREEN_W, SCREEN_H-64-49))
        
        tableView!.registerNib(UINib(nibName:"ZBSportNewsTableViewCell",bundle: nil), forCellReuseIdentifier: "ZBSportNewsTableViewCell")
        
         tableView!.delegate = self
        
         tableView!.dataSource = self
        
         self.view.addSubview(tableView!)
        
    }
    
    func creatGet()
    {
        let dic:Dictionary<String,AnyObject>  = ["apikey":ZBSportNewsKey,"num":num,"page":page]
        
        AMFHelper .BaiduGet(baiduNewsTouTiaoUrl, parameters: dic, success: { (responseObject) in
            
            print(responseObject)
            
            let result = JSON(responseObject)
            
            let arr = result["data"]["article"].array!
            
            print(arr)

            
            for dic in arr{
                
                let model = ZBSportNewsModel()
                
                model.setValuesForKeysWithDictionary(dic.dictionaryObject!)
                
                self.nsMuArray.append(model)
                
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                
//                if self.page == 1
//                {
//                    self.HeadlineTableView!.mj_header.endRefreshing()
//                    
//                }
//                else
//                {
//                    
//                    self.HeadlineTableView!.mj_footer.endRefreshing()
//                    
//                }
                
                self.tableView!.reloadData()
                
                
            })
            
        }) { (error) in
            
            print(error)
            
        }

    
    }

}
extension ZBSportNewsViewController:UITableViewDelegate,UITableViewDataSource
{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return  1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return 10
        return (nsMuArray.count)

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let model = nsMuArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ZBSportNewsTableViewCell") as! ZBSportNewsTableViewCell
        
         return cell.refreshCellHeight(model)
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCellWithIdentifier("ZBSportNewsTableViewCell") as! ZBSportNewsTableViewCell
        
        cell.refreshCellWithModel(self.nsMuArray[indexPath.row] )
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        
        let Vc = ZBSportContentViewController()
        
        let str = nsMuArray[indexPath.row].url
        
        var str1 = Vc.urlContent
        
        str1 = str
        
        Vc.urlContent = str1
        
        self.navigationController?.pushViewController(Vc, animated: true)

        
    }
    
}


