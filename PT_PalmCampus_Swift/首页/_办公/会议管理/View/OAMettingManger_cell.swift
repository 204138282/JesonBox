//
//  OAMettingManger_cell.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/24.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class OAMettingManger_cell: UITableViewCell {

    @IBOutlet var title_label: UILabel!     //标题
    @IBOutlet var time_label: UILabel!      //日期
    @IBOutlet var status_label: UILabel!    //审核状态
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /******************************模型化数据**********************************/
    func setCellWithModel(object: OAMettingManager_Model) {
//        if object.isKind(of: OAMettingManager_Model.self) {
//            let model = OAMettingManager_Model.init()
//            
//            self.title_label.text = nil
//        }
    }
    
}
