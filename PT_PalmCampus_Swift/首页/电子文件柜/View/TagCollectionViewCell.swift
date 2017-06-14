//
//  TagCollectionViewCell.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 11/05/2017.
//  Copyright © 2017 Kbird. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = ARC4RANDOM_COLOR
            self.addSubview(titleLabel)
        }
    
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: self.centerY - 10, width: self.width, height: 20))
        label.textColor = .black
        label.textAlignment = .center
        label.lineBreakMode = NSLineBreakMode.byCharWrapping
        return label
    }()
}
