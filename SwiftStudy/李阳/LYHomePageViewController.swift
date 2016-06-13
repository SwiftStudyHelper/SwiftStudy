//
//  LYHomePageViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/8.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit

class LYHomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellowColor()
        
        let url = "http://apis.baidu.com/songshuxiansheng/news/news"
        let httpArg = ""
        request(url, httpArg: httpArg)
        // Do any additional setup after loading the view.
        
    }
    

        

    func request(httpUrl: String, httpArg: String) {
            let req = NSMutableURLRequest(URL: NSURL(string: httpUrl + "?" + httpArg)!)
            req.timeoutInterval = 6
            req.HTTPMethod = "GET"
            req.addValue(BAIDUAPIKEY, forHTTPHeaderField: "apikey")
            NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue()) {
                (response, data, error) -> Void in
//                let res = response as! NSHTTPURLResponse
//                print(res.statusCode)
                if let e = error{
                    print("请求失败")
                }
                if let d = data {
                    var content = NSString(data: d, encoding: NSUTF8StringEncoding)
                    print(content)
                }
            }
        }



}
