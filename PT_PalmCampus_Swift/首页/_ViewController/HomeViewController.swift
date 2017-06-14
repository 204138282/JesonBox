//
//  HomeViewController.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/12.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 27 / 255.0, green: 162 / 255.0, blue: 226 / 255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        //  MARK:   注册单元格
        self.collectionView.register(UINib.init(nibName: "HomeCollectionCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionCell")
        self.view.addSubview(self.collectionView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //  MARK:  - - 懒加载
    lazy var collectionView: UICollectionView = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: (KWIDTH - 10 - 10 - 15 * 3) / 4, height: 100)
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 0, right: 10)
        let collection: UICollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: KWIDTH, height: KHEIGHT), collectionViewLayout: flowLayout)
        collection.isUserInteractionEnabled = true
        collection.backgroundColor = UIColor.white
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath) as! HomeCollectionCell
        switch indexPath.item {
        case 0:
            cell.office_UIImageView.image = #imageLiteral(resourceName: "icon_oa").withRenderingMode(.alwaysOriginal)
            cell.office_Label.text = "办公"
            break
        case 1:
            cell.office_UIImageView.image = #imageLiteral(resourceName: "icon_deyu").withRenderingMode(.alwaysOriginal)
            cell.office_Label.text = "德育"
            break
        case 2:
            cell.office_UIImageView.image = #imageLiteral(resourceName: "icon_sc").withRenderingMode(.alwaysOriginal)
            cell.office_Label.text = "成绩"
            break
        case 3:
            cell.office_UIImageView.image = #imageLiteral(resourceName: "icon_web").withRenderingMode(.alwaysOriginal)
            cell.office_Label.text = "网站"
            break
        case 4:
            cell.office_UIImageView.image = #imageLiteral(resourceName: "icon_cgyy").withRenderingMode(.alwaysOriginal)
            cell.office_Label.text = "场馆预约"
            break
        case 5:
            cell.office_UIImageView.image = UIImage.init(named: "icon_fileBox")
            cell.office_Label.text = "文件柜"
            break;
        default:
            cell.office_UIImageView.image = #imageLiteral(resourceName: "bt_dynamic_del_focused").withRenderingMode(.alwaysOriginal)
            cell.office_Label.text = "<无此项>"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let officeVC = OfficeViewController.init()
            officeVC.navigationItem.title = "办公"
            officeVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(officeVC, animated: true)
            break
        case 1:
            let dyVC = EducatViewController.init()
            dyVC.navigationItem.title = "德育"
            self.navigationController?.pushViewController(dyVC, animated: true)
            break
        case 2:
            let examVC = ExamViewController.init()
            examVC.navigationItem.title = "成绩"
            self.navigationController?.pushViewController(examVC, animated: true)
            break
        case 3:
            let webVC = WebViewController.init()
            webVC.navigationItem.title = "网站"
            self.navigationController?.pushViewController(webVC, animated: true)
            break
        case 4:
            let cgyyVC = CGYYViewController.init()
            cgyyVC.navigationItem.title = "场馆预约"
            self.navigationController?.pushViewController(cgyyVC, animated: true)
            break
        case 5:
            let fileBoxVC: FileBoxViewController = FileBoxViewController.init()
            fileBoxVC.navigationItem.title = "电子文件柜"
            self.navigationController?.pushViewController(fileBoxVC, animated: true)
            break
        default:
            break
        }
    }
    
}
