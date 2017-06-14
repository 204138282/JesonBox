//
//  RepairTableView_cell.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/28.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class RepairTableView_cell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle , reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(title_label)
        self.addSubview(time_label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var title_label: UILabel = {
        let model = Repair_Model.init()
       let label = UILabel.init(frame: CGRect.init(x: 10, y: 5, width: KWIDTH - 50, height: 20))
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var time_label: UILabel = {
       let label = UILabel.init(frame: CGRect.init(x: 10, y: self.title_label.frame.maxY + 5, width: KWIDTH - 50, height: 20))
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
}
