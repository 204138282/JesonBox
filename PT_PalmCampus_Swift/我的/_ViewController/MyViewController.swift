//
//  MyViewController.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/12.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 27 / 255.0, green: 162 / 255.0, blue: 226 / 255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        self.__addSubView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public var head_Button: UIButton = {
        let head: UIButton = UIButton.init(type: UIButtonType.custom)
        head.frame = CGRect.init(x: 30, y: 64 + 20, width: 100, height: 100)
        head.layer.cornerRadius = 50
        head.layer.borderColor = UIColor.init(red: 0 / 255.0, green: 191 / 255.0, blue: 255 / 255.0, alpha: 1).cgColor
        head.layer.borderWidth = 0.5
        head.layer.masksToBounds = true
        head.setImage(#imageLiteral(resourceName: "Miku_fly").withRenderingMode(.alwaysOriginal), for: .normal)
        head.addTarget(self, action: #selector(headImageAction(sender:)), for: .touchUpInside)
        return head
    }()
    
    var head_title: UILabel = {
        let title: UILabel = UILabel.init(frame: CGRect.init(x: 30 + 100 + 15, y: 64 + 50, width: KWIDTH - 120, height: 40))
        title.text = "系统管理员"
        title.textAlignment = .left
        title.textColor = UIColor.black
        title.numberOfLines = 0
        return title
    }()
    
    var loginOut_Button: UIButton = {
        let loginOut = UIButton.init(type: UIButtonType.custom)
        loginOut.frame = CGRect.init(x: 0, y: 64 + 160, width: KWIDTH, height: 50)
        loginOut.setTitle("退出", for: .normal)
        loginOut.setTitleColor(UIColor.black, for: .normal)
        loginOut.isHighlighted = true
        loginOut.backgroundColor = UIColor.init(red: 241 / 255.0, green: 242 / 255.0, blue: 243 / 255.0,alpha: 1.0)
        loginOut.addTarget(self, action: #selector(loginOutAction(sender:)), for: .touchUpInside)
        return loginOut
    }()
    
    func __addSubView() {
        self.view.addSubview(head_Button)
        self.view.addSubview(head_title)
        self.view.addSubview(loginOut_Button)
        
    }
    
    func headImageAction(sender: UIButton) {
        print("我的---头像---headImageAction(sender: UIButton)")
    }
    
    func loginOutAction(sender: UIButton) {
        print("我的---退出---loginOutAction(sender: UIButton)")
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
