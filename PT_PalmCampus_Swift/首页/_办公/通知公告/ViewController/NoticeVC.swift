//
//  NoticeVC.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/22.
//  Copyright © 2017年 Kbird. All rights reserved.
//
import UIKit

class NoticeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        self.__backItem()
        self.__rightBarItem()
        let noticeView = NoticeView.init(frame: CGRect.init(x: 0, y: 20 + 44 , width: KWIDTH, height: KHEIGHT))
        self.view.addSubview(noticeView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /******************************返回**********************************/
    func __backItem() {
        let itemView: Back_UIView = Back_UIView.init()
        itemView.back_title.text = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: itemView)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(backViewAction(sender:)))
        itemView.addGestureRecognizer(tap)
    }
    func backViewAction(sender: UITapGestureRecognizer) -> () {
//        for i in 0..<(self.navigationController?.viewControllers.count)! {
//            if self.navigationController?.viewControllers[i] .isKind(of: UIViewController.self) == true {
//                _ = self.navigationController?.popToViewController(self.navigationController?.viewControllers[i] as! HomeViewController, animated: true)
//                break
//            }
//        }
        _ = self.navigationController?.popViewController(animated: true)
    }
    /******************************发布**********************************/
    func __rightBarItem() {
        let item = UIBarButtonItem.init(title: "发布", style: .plain, target: self, action: #selector(sendNotificationAction(sender:)))
        self.navigationItem.rightBarButtonItem = item
    }
    
    func sendNotificationAction(sender: UIBarButtonItem) {
        print("sendNotificationAction---发布实现")
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

/******************************NoticeView代理**********************************/
extension NoticeView: NoticeViewProtocol{
    
    // MARK:  MARK﹏﹏﹏﹏﹏﹏﹏﹏﹏UISegmentController﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
    func _segmentAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("当前选中---[\(sender.selectedSegmentIndex)]")
            self.tableView.rowHeight = 60
            self.tableView.reloadData()
            break
        case 1:
            print("当前选中---[\(sender.selectedSegmentIndex)]")
            self.tableView.rowHeight = 100
            self.tableView.reloadData()
            break
        case 2:
            print("当前选中---[\(sender.selectedSegmentIndex)]")
            self.tableView.rowHeight = 120
            self.tableView.reloadData()
            break
        default:
            break
        }
        
    }
    
    // MARK:  MARK﹏﹏﹏﹏﹏﹏﹏﹏﹏TableView代理﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ID = "NoticeVC_cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: ID) as? NoticeVC_cell
        if cell == nil {
            cell = NoticeVC_cell.init(style: .default, reuseIdentifier: ID)
        }
        let model = NoticeView_Model()
        let model_dic = model.data_array as NSDictionary
        cell?.title_label.text = model_dic.object(forKey: "title") as? String
        cell?.name_label.text = model_dic.object(forKey: "name") as? String
        cell?.time_label.text = model_dic.object(forKey: "time") as? String
        return cell!
    }
}
