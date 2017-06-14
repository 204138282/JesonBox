//
//  ExamViewController.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/12.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class ExamViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.__backItem()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///返回
    func __backItem() -> () {
        let backView: Back_UIView = Back_UIView.init()
        backView.back_title.text = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backView)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(backViewAction(sender:)))
        backView.addGestureRecognizer(tap)
    }

    func backViewAction(sender: UITapGestureRecognizer) -> () {
        for i in 0..<(self.navigationController?.viewControllers.count)! {
            if self.navigationController?.viewControllers[i] .isKind(of: UIViewController.self) == true {
                _ = self.navigationController?.popToViewController(self.navigationController?.viewControllers[i] as! HomeViewController, animated: true)
                break
            }
        }
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
