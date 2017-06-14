//
//  NoticeVC_cell.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/22.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class NoticeVC_cell: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier reuseIdentifer: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifer)
        self.contentView.addSubview(title_label)
        self.contentView.addSubview(name_label)
        self.contentView.addSubview(time_label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /******************************Cell中_属性**********************************/
    //标题
    lazy var title_label: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 10, y: self.center.y - 10, width: KWIDTH - 20, height: 20))
        label.textAlignment = .left
        label.lineBreakMode = .byClipping
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        return label
    }()
    
    //发布人
    lazy var name_label: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 10, y: self.center.y - 10 + 20 + 5, width: KWIDTH / 4, height: 15))
        label.textAlignment = .left
        label.lineBreakMode = .byClipping
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
       return label
    }()
    
    //发布时间
    lazy var time_label: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 10 + self.name_label.frame.size.width + 10, y: self.name_label.frame.origin.y, width: KWIDTH - (10 + self.name_label.frame.size.width + 10 + 10) , height: 15))
        label.textAlignment = .left
        label.lineBreakMode = .byClipping
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        return label
    }()
}
