
//
//  Repair_View.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/27.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class Repair_View: UIView {

    let model = Repair_Model.init()
    //var delegate: Repair_ViewProtocol! = nil
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        __titleDataSource()
        self.addSubview(stackView)
        self.addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /******************************UIStackView**********************************/
    lazy var stackView: UIStackView  = {
       let stack = UIStackView.init(frame: CGRect.init(x: 0, y: 0, width: KWIDTH, height: 30))
        stack.distribution = .fillEqually
        stack.spacing = 0.0
        return stack
    }()
    
    func __titleDataSource() {
        var button = UIButton()
        for i in 0...5 {
            button = UIButton.init(type: UIButtonType.custom)
            button.setTitle(model.title_Arr[i] , for: UIControlState.normal)
            button.tag = 1000 + i
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            button.titleLabel?.textAlignment = .center
            button.setTitleColor(UIColor.black, for: .normal)
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.borderWidth = 0.5
            button.layer.masksToBounds = true
            button.addTarget(self, action:#selector(titleButtonAction(sender:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    
    /******************************UITableView**********************************/
    lazy var tableView: UITableView = {
       let table = UITableView.init(frame: CGRect.init(x: 0, y: 30, width: KWIDTH, height: KHEIGHT - 64 - 30))
        table.separatorInset = UIEdgeInsets.zero
        table.tableFooterView = UIView.init()
        table.rowHeight = 50
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = true
        return table
    }()
}

protocol Repair_ViewProtocol: UITableViewDelegate,UITableViewDataSource {
    
    func titleButtonAction(sender: UIButton)
}
