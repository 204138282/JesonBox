//
//  RepairViewController.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/27.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class RepairViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        layoutBasicView()
        let repairView = Repair_View.init(frame: CGRect.init(x: 0, y: 64, width: KWIDTH, height: KHEIGHT - 64))
        self.view.addSubview(repairView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func layoutBasicView() {
        /******************************导航栏右侧item**********************************/
        let rightItem = UIBarButtonItem.init(title: "报修", style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightItemRepairAction(sender:)))
        self.navigationItem.rightBarButtonItem = rightItem
        
        /******************************返回**********************************/
        let itemView = Back_UIView.init()
        itemView.back_title.text = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: itemView)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(backViewAction(sender:)))
        itemView.addGestureRecognizer(tap)
    }
    func rightItemRepairAction(sender: UIBarButtonItem) {
        print("报修---rightItemRepairAction(sender:)---  :RepairViewController")
    }
    
    func backViewAction(sender: UITapGestureRecognizer) {
        print("返回---backViewAction(sender:)---  :RepairViewController")
        _ = self.navigationController?.popViewController(animated: true)
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

extension Repair_View: Repair_ViewProtocol {
    
    func titleButtonAction(sender: UIButton) {
        switch sender.tag {
        case 1000:
            print("提交中---titleButtonAction---tag_1000---  :RepairViewController")
            self.tableView.rowHeight = 60
            self.tableView.reloadData()
            break
        case 1001:
            print("维修中---titleButtonAction---tag_1001---  :RepairViewController")
            self.tableView.rowHeight = 70
            self.tableView.reloadData()
            break
        case 1002:
            print("已维修---titleButtonAction---tag_1002---  :RepairViewController")
            self.tableView.rowHeight = 80
            self.tableView.reloadData()
            break
        case 1003:
            print("不能维修---titleButtonAction---tag_1003---  :RepairViewController")
            self.tableView.rowHeight = 90
            self.tableView.reloadData()
            break
        case 1004:
            print("需指派---titleButtonAction---tag_1004---  :RepairViewController")
            self.tableView.rowHeight = 100
            self.tableView.reloadData()
            break
        case 1005:
            print("需维修---titleButtonAction---tag_1005---  :RepairViewController")
            self.tableView.rowHeight = 110
            self.tableView.reloadData()
            break
        default:
            break
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = Repair_Model.init()
        return model.cellModel_arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = Repair_Model.init()
        let identifier = "RepairTable_cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? RepairTableView_cell
        if cell == nil {
            cell = RepairTableView_cell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        cell?.title_label.text = (model.cellModel_arr[indexPath.row] as NSDictionary).value(forKey: "title") as? String
        cell?.time_label.text = (model.cellModel_arr[indexPath.row] as NSDictionary).value(forKey: "time") as? String
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击---测试---1.2.3.4.5.6.7---  :RepairViewController")
    }
    
}
