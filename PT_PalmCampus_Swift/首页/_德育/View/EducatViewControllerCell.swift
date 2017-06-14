//
//  EducatViewControllerCell.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/17.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class EducatViewControllerCell: UITableViewCell {
    
    var titleLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubviews() {
        titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 20))
        self.contentView.addSubview(titleLabel)
    }
    
}
