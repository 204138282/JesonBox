//
//  Back_UIView.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/12.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class Back_UIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addsubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var back_image: UIImageView = {
       let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: -9, width: 18, height: 14))
        imageView.image = #imageLiteral(resourceName: "arrow_left1")
        return imageView
    }()
    
    lazy var back_title: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 40, y: -8, width: KWIDTH / 4, height: 15))
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var back_line: UIView = {
        let line = UIView.init(frame: CGRect.init(x: 35, y: -17, width: 1, height: 30))
        line.backgroundColor = UIColor.white
        return line
    }()
    
    func addsubViews() {
        self.addSubview(self.back_image)
        self.addSubview(self.back_line)
        self.addSubview(self.back_title)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
