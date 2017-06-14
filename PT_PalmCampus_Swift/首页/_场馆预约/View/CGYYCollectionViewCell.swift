//
//  CGYYCollectionViewCell.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/20.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class CGYYCollectionViewCell: UICollectionViewCell {

    @IBOutlet var head_imageView: UIImageView!
    @IBOutlet var head_titleLabel: UILabel!
    @IBOutlet var head_tatalCount: UILabel!
    @IBOutlet var head_remainCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = ARC4RANDOM_COLOR
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    
}
