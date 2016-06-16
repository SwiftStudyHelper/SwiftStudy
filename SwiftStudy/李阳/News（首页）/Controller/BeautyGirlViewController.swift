//
//  BeautyGirlViewController.swift
//  SwiftStudy
//
//  Created by liyang@l2cplat.com on 16/6/14.
//  Copyright © 2016年 yang_li828@163.com. All rights reserved.
//

import UIKit
import Photos
import AssetsLibrary


class BeautyGirlViewController: UIViewController {
    
    var collectionView:UICollectionView?

    //资源库管理类
    var Lib:PHPhotoLibrary?
    
    var assets = [ALAsset]()
    
    var assetsLibrary = ALAssetsLibrary()

    var collectionLayout:UICollectionViewFlowLayout? =  UICollectionViewFlowLayout()
        //保存照片集合


    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func creatUI() {
        
        self.collectionView = UICollectionView(frame: CGRectMake(SCREEN_W*6, 0, SCREEN_W, SCREEN_H-Navi_H-Bar_H), collectionViewLayout: collectionLayout!)
        
        self.collectionView?.delegate = self;
        
        self.collectionView?.dataSource = self;
        
        
        self.collectionView?.registerNib(UINib(nibName: "LYLocalImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LYLocalImageCollectionViewCell")
        
        collectionLayout?.itemSize = CGSizeMake(100, 100)
        
        PHPhotoLibrary.requestAuthorization { (PHAuthorizationStatus) in
            
            self.Lib =  PHPhotoLibrary.sharedPhotoLibrary()

        }
        
        assetsLibrary.enumerateGroupsWithTypes(ALAssetsGroupSavedPhotos, usingBlock: { (group: ALAssetsGroup!, stop) in
            
            if group != nil
            {
                let assetBlock : ALAssetsGroupEnumerationResultsBlock = {
                    (result: ALAsset!, index: Int, stop) in
                    if result != nil
                    {
                        self.assets.append(result)
                    }
                }
                group.enumerateAssetsUsingBlock(assetBlock)
                
                print(self.assets.count)
                //collectionView网格重载数据
                self.collectionView?.reloadData()
            }
            
            }) { (err) in
                
        }
        

        

        
    }

    
}

extension BeautyGirlViewController:UICollectionViewDelegate,UICollectionViewDataSource
{

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.assets.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = (collectionView.dequeueReusableCellWithReuseIdentifier("LYLocalImageCollectionViewCell", forIndexPath: indexPath) as! LYLocalImageCollectionViewCell)
        
//        let myAsset = self.assets[indexPath.item]
//        
//        let image = UIImage(CGImage:myAsset.thumbnail().takeUnretainedValue())
        
        
        //获取原图
        let representation =  self.assets[indexPath.item].defaultRepresentation()
        
        let imageBuffer = UnsafeMutablePointer<UInt8>.alloc(Int(representation.size()))
        let bufferSize = representation.getBytes(imageBuffer, fromOffset: Int64(0),
                                                 length: Int(representation.size()), error: nil)
        let data =  NSData(bytesNoCopy:imageBuffer ,length:bufferSize, freeWhenDone:true)
        cell.imgView.image = UIImage(data: data)
        
        return cell
    
    }



}
