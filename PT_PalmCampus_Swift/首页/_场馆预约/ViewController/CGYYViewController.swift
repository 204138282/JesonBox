//
//  CGYYViewController.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/12.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class CGYYViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.__backItem()
        self.view.addSubview(collectionView)
        collectionView.register(UINib.init(nibName: "CGYYCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CGYYCollectionViewCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///返回
    func __backItem() {
        let backView: Back_UIView = Back_UIView.init()
        backView.back_title.text = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backView)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(backViewAction(sender:)))
        backView.addGestureRecognizer(tap)
    }
    
    func backViewAction(sender: UITapGestureRecognizer) {
        for i in 0..<(self.navigationController?.viewControllers.count)! {
            if self.navigationController?.viewControllers[i] .isKind(of: UIViewController.self) == true  {
                _ = self.navigationController?.popToViewController(self.navigationController?.viewControllers[i] as! HomeViewController, animated: true)
                break
            }
        }
    }
    
    // MARK:  MARK﹏﹏﹏﹏﹏﹏﹏﹏﹏懒加载﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
    lazy var collectionView: UICollectionView = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: KWIDTH / 2 - 60, height: KWIDTH / 2)
        flowLayout.minimumLineSpacing = 30
        flowLayout.minimumInteritemSpacing = 30
        flowLayout.sectionInset = UIEdgeInsetsMake(20, 30, 0, 30)
        let collection: UICollectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: flowLayout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        return collection
    }()
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

extension CGYYViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifer: String = "CGYYCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath) as! CGYYCollectionViewCell
        cell.backgroundColor = ARC4RANDOM_COLOR
        
        switch indexPath.item {
        case 0:
            cell.head_imageView.image = #imageLiteral(resourceName: "venues_4")
            cell.head_titleLabel.text = "图书馆"
            cell.head_tatalCount.text = "总场馆数:\(1)"
            cell.head_remainCount.text = "今日还可预约:\(1)"
            break
        case 1:
            cell.head_imageView.image = #imageLiteral(resourceName: "venues_2")
            cell.head_titleLabel.text = "体育馆"
            cell.head_tatalCount.text = "总场馆数:\(2)"
            cell.head_remainCount.text = "今日还可预约:\(2)"
            break
        case 2:
            cell.head_imageView.image = #imageLiteral(resourceName: "venues_3")
            cell.head_titleLabel.text = "实验室"
            cell.head_tatalCount.text = "总场馆数:\(3)"
            cell.head_remainCount.text = "今日还可预约:\(3)"
            break
        case 3:
            cell.head_imageView.image = #imageLiteral(resourceName: "venues_1")
            cell.head_titleLabel.text = "会议馆"
            cell.head_tatalCount.text = "总场馆数:\(4)"
            cell.head_remainCount.text = "今日还可预约:\(4)"
            break
        default:
            UIAlertController.TIP_ALERT(alertTitle: "", alertMessage: "暂无此项", alertStyle: .alert, viewController: self)
        }
        return cell
    }
    
}
