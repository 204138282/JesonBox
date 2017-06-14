//
//  EducatViewController.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/12.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class EducatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.__backItem()
        self.__segmentController()
        self.view.addSubview(tableView)

// MARK:  MARK﹏﹏﹏﹏﹏﹏﹏﹏﹏XIB注册单元格﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
//        tableView.register(EducatViewControllerCell.self, forCellReuseIdentifier: "EducatViewControllerCell")
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
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(backViewAction(sender:)))
        backView.addGestureRecognizer(tap)
    }
    
    func backViewAction(sender: UITapGestureRecognizer) {
        for i in 0..<(self.navigationController?.viewControllers.count)! {
            if self.navigationController?.viewControllers[i] .isKind(of: UIViewController.self) == true {
                _ = self.navigationController?.popToViewController(self.navigationController?.viewControllers[i] as! HomeViewController, animated: true)
                break
            }
        }
    }
    
    lazy var tableView: UITableView = {
        let table: UITableView  = UITableView.init(frame: CGRect.init(x: 0, y: 64 + 50, width: KWIDTH, height: KHEIGHT - 64 - 50 - 44))
        table.rowHeight = 50
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    func __segmentController() {
//        let segmentC: UISegmentedControl = UISegmentedControl.init(frame: CGRect.init(x: 0, y: (self.navigationController?.navigationBar.frame.size.height)!, width: KWIDTH, height: 80))
        let items_array: NSArray = ["通知公告","班级管理","学生奖惩","与我相关"]
        let segmentC: UISegmentedControl = UISegmentedControl.init(items: items_array as? Array)
        segmentC.frame = CGRect.init(x: 0, y: 64, width: KWIDTH, height: 50)
        segmentC.addTarget(self, action: #selector(segmentCAction(sender:)), for: .touchUpInside)
        /**
        //插入_图片
        segmentC.insertSegment(with: #imageLiteral(resourceName: "icon16").withRenderingMode(.alwaysOriginal), at: 0, animated: true)
        segmentC.insertSegment(with: #imageLiteral(resourceName: "icon17").withRenderingMode(.alwaysOriginal), at: 1, animated: true)
        segmentC.insertSegment(with: #imageLiteral(resourceName: "icon18").withRenderingMode(.alwaysOriginal), at: 2, animated: true)
        segmentC.insertSegment(with: #imageLiteral(resourceName: "icon19").withRenderingMode(.alwaysOriginal), at: 3, animated: true)
        //插入_文字
        segmentC.insertSegment(withTitle: "通知公告", at: 0, animated: true)
        segmentC.insertSegment(withTitle: "班级管理", at: 1, animated: true)
        segmentC.insertSegment(withTitle: "学生奖惩", at: 2, animated: true)
        segmentC.insertSegment(withTitle: "与我相关", at: 3, animated: true)
        */
        //设置背景
        segmentC.tintColor = UIColor.RGBA_COLOR(red_c: 27, green_c: 162, blue_c: 226, alpha_c: 1.0)

        self.view.addSubview(segmentC)
    }
    
    func segmentCAction(sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 0:
//            <#code#>
//        default:
//            <#code#>
//        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}

extension EducatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "EducateViewControllerCell", for: indexPath) as! EducatViewControllerCell
        var cell = tableView.dequeueReusableCell(withIdentifier: "EducateViewControllerCell") as? EducatViewControllerCell
        if cell == nil {
            cell = EducatViewControllerCell.init(style: .default, reuseIdentifier: "EducatViewControllerCell")
        }
        cell?.titleLabel.text = "策策策试试试---\(indexPath.row)"
        return cell!
    }
}

