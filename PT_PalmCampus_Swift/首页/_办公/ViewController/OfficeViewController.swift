//
//  OfficeViewController.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/12.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class OfficeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let dict: NSDictionary = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = dict as? [String : Any]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.__backItem()
        self.__collectionViewSetting()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///返回
    func __backItem() {
        let itemView: Back_UIView = Back_UIView.init()
        itemView.back_title.text = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: itemView)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(backViewAction(sender:)))
        itemView.addGestureRecognizer(tap)
    }
    
    func backViewAction(sender: UITapGestureRecognizer) -> () {
        for i in 0..<(self.navigationController?.viewControllers.count)! {
            if self.navigationController?.viewControllers[i] .isKind(of: UIViewController.self) == true {
               _ = self.navigationController?.popToViewController(self.navigationController?.viewControllers[i] as! HomeViewController, animated: true)
                break
            }
        }
    }
    
    lazy var collectionView : UICollectionView = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: (KWIDTH - 20 - 3 * 15) / 4, height: 100)
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10)
        let collection: UICollectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collection.backgroundColor = UIColor.white
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    //  MARK:   集合试图
    func __collectionViewSetting(){
        self.view.addSubview(collectionView)
                collectionView.register(UINib.init(nibName: "OfficeCollectionCell", bundle: nil), forCellWithReuseIdentifier: "OfficeCollectionCell")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    let itemArray: NSArray = [["img":"tz.jpg","title":"通知公告"],
               ["img":"schedule.jpg","title":"日程安排"],
               ["img":"gz.jpg","title":"工资查询"],
               ["img":"sb.jpg","title":"设备报修"],
               ["img":"car.jpg","title":"用车申请"],
               ["img":"zl.jpg","title":"资料印制"],
               ["img":"hy.jpg","title":"会议管理"]]
}

///﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
// MARK:  MARK﹏﹏﹏﹏﹏﹏﹏﹏﹏Extension_扩展﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
///﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏

extension OfficeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfficeCollectionCell", for: indexPath) as! OfficeCollectionCell
        let dic = itemArray.object(at: indexPath.item) as! NSDictionary
        cell.head_imageView.image = UIImage.init(named: dic.value(forKey: "img") as! String)
        cell.head_titleLabel.text = dic.value(forKey: "title") as? String
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        /// swift弹出框
        /*
        let alertC: UIAlertController = UIAlertController.init(title: "提示", message: "已点击---item", preferredStyle: .actionSheet)
        let cancelAction: UIAlertAction = UIAlertAction.init(title: "cancel", style: .cancel) { (action) in
            print("已点击---cancel")
        }
        let sureAction: UIAlertAction = UIAlertAction.init(title: "sure", style: .default) { (action) in
            print("已点击---sure")
        }
        alertC.addAction(cancelAction)
        alertC.addAction(sureAction)
        self.present(alertC, animated: true, completion: nil)
        */
        switch indexPath.item {
        case 0:
            let noticeVC = NoticeVC.init()
            noticeVC.navigationItem.title = "通知公告"
            self.navigationController?.pushViewController(noticeVC, animated: true)
            break
        case 3:
            let repairVC = RepairViewController.init()
            repairVC.navigationItem.title = "设备报修"
            self.navigationController?.pushViewController(repairVC, animated: true)
            break
        case 6:
            let mettingManagerVC = OAMettingManager_ViewController.init()
            mettingManagerVC.navigationItem.title = "会议管理"
            self.navigationController?.pushViewController(mettingManagerVC, animated: true)
            break
        default:
            break
        }
        
    }
}


