//
//  NoticeView.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/22.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class NoticeView: UIView {

    static let name: String = String()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(segmentController)
        self.addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /******************************分段控制器**********************************/
    lazy var segmentController: UISegmentedControl = {
        let segment_arr: NSArray = ["未读","已读","已发"]
        let segment: UISegmentedControl = UISegmentedControl.init(frame: CGRect.init(x: 0, y: -1, width: KWIDTH, height: 50))
        segment.selectedSegmentIndex = 0
        segment.insertSegment(withTitle: segment_arr[0] as? String, at: 0, animated: true)
        segment.insertSegment(withTitle: segment_arr[1] as? String, at: 1, animated: true)
        segment.insertSegment(withTitle: segment_arr[2] as? String, at: 2, animated: true)
        segment.addTarget(self, action: #selector(_segmentAction(sender:)), for: .valueChanged)
        return segment
    }()

    /******************************tableView**********************************/
    lazy var tableView: UITableView = {
        let table = UITableView.init(frame: CGRect.init(x: 0, y: self.segmentController.frame.size.height, width: KWIDTH, height: KHEIGHT))
        table.separatorInset = UIEdgeInsets.zero
        table.rowHeight = 60
        table.backgroundColor = UIColor.white
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
}

// MARK:  MARK﹏﹏﹏﹏﹏﹏﹏﹏﹏Protocol_协议声明﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
protocol NoticeViewProtocol: UITableViewDelegate,UITableViewDataSource{
    func _segmentAction(sender: UISegmentedControl)
}

