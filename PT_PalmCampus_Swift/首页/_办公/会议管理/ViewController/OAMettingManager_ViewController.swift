//
//  OAMettingManager_ViewController.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/24.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class OAMettingManager_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        __backItem()
        let OABase_View = OAMettingManager_View.init(frame: CGRect.init(x: 0, y: 64, width: KWIDTH, height: KHEIGHT - 64))
        self.view.addSubview(OABase_View)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /******************************返回**********************************/
    func __backItem() {
        let itemView = Back_UIView.init()
        itemView.back_title.text = "会议管理"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: itemView)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(backViewAction(sender:)))
        itemView.addGestureRecognizer(tap)
    }
    
    func backViewAction(sender: UITapGestureRecognizer)  {
       _ = self.navigationController?.popToViewController((self.navigationController?.viewControllers[1])!, animated: true)
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

extension OAMettingManager_View: OAMettingManager_ViewProtocol {
    func _segmentAction(sender: UISegmentedControl) {
        print("分段控制器---_segmentAction---  :OAMettingManager_viewController")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OAMettingManager_Model.init().data_arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OAMettingManger_cell", for: indexPath) as! OAMettingManger_cell
        let model = OAMettingManager_Model()
        let dic = model.data_arr[indexPath.row] as NSDictionary
        cell.title_label.text = dic.value(forKey: "title") as? String
        cell.time_label.text = dic.value(forKey: "time") as? String
        cell.status_label.text = dic.value(forKey: "status") as? String
        return cell
    }
}
