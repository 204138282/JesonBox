//
//  FileBoxViewController.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 04/05/2017.
//  Copyright © 2017 Kbird. All rights reserved.
//

import UIKit

class FileBoxViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
        self.backItem()
        self.view.addSubview(myFileBoxView)
//        myFileBoxView.delegate = self
        self.rightItem()
        self.titleView_Custom()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backItem() {
        let back: Back_UIView = Back_UIView.init()
        back.back_title.text = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: back)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapBackAction(sender:)))
        back.addGestureRecognizer(tap)
    }
    func tapBackAction(sender:UITapGestureRecognizer) {
        _ = self.navigationController?.popViewController(animated: true)      //或下面方法
//        _  = self.navigationController?.popToViewController((self.navigationController?.viewControllers[0])!, animated: true)
        
    }
    
    lazy var myFileBoxView:MyFileBoxView = {
        let fileBoxView = MyFileBoxView.init(frame: CGRect.init(x: 0, y: 64, width: KWIDTH, height: KHEIGHT - 64 - 44))
        fileBoxView.backgroundColor = .white
        return fileBoxView
    }()
    
    func rightItem() {
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: 50, height: 20)
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, -5)
        btn.setTitle("设置", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(rightItemAction(sender:)), for: .touchUpInside)
        let rightItem: UIBarButtonItem = UIBarButtonItem.init(customView: btn)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func rightItemAction(sender:UIButton) {
        let alertC: UIAlertController = UIAlertController.init(title: "提示", message: "[rightItem]", preferredStyle: .alert)
        let sureAction: UIAlertAction = UIAlertAction.init(title: "确定", style: .default) { (_) in
            print("确定")
        }
        let cancelAction: UIAlertAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel) { (_) in
            print("取消")
        }
        alertC.addAction(sureAction)
        alertC.addAction(cancelAction)
        self.present(alertC, animated: true) { 
            
        }
    }
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView.init(frame: CGRect.init(x: KWIDTH / 3, y:(self.navigationController?.navigationBar.frame.origin.y)! + (self.navigationController?.navigationBar.frame.size.height)! , width: KWIDTH / 3, height: 100))
        stack.distribution = .fillEqually
        stack.axis = .vertical
        let btna = UIButton.init()
        btna.setTitle("我的文件柜", for: UIControlState.normal)
        btna.backgroundColor = UIColor.RGBA_COLOR(red_c: 17, green_c: 144, blue_c: 223, alpha_c: 1.0)
        let btnb = UIButton.init()
        btnb.setTitle("公共文件柜", for: UIControlState.normal)
        btnb.backgroundColor = UIColor.RGBA_COLOR(red_c: 17, green_c: 144, blue_c: 223, alpha_c: 1.0)
        stack.addArrangedSubview(btna)
        stack.addArrangedSubview(btnb)
        return stack
    }()
    
    func titleView_Custom () {
        let button: UIButton = UIButton.init(type: .custom)
        button.frame = CGRect.init(x: KWIDTH / 3, y: 0, width: KWIDTH / 3, height: 20)
        button.setTitle("我的文件柜", for: .normal)
        button.contentMode = .center
        button.addTarget(self, action: #selector(titleViewAction(sender:)), for: .touchUpInside)
        self.navigationItem.titleView = button
        
    }
    
    func titleViewAction(sender:UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true {
            self.view.addSubview(stackView)
        }else {
            if stackView .isKind(of: NSNull.self) {
               print("NSNull Class")
            }else {
                 stackView.removeFromSuperview()
            }
        }
    }
}

extension MyFileBoxView: MyFileBoxViewProtocol{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ID: String = "TagCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID, for: indexPath) as! TagCollectionViewCell
        cell.backgroundColor = .blue
        cell.titleLabel.text = "当前：\(indexPath.item)"
        return cell
    }
    
}
