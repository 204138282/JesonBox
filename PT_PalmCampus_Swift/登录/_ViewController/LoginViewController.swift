//
//  LoginViewController.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/23.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "登录"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.RGBA_COLOR(red_c: 27, green_c: 162, blue_c: 226, alpha_c: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        /******************************登录界面**********************************/
        let loginView = LoginBasic_View.init(frame: self.view.bounds)
        
        /******************************协议实现---点击事件④**********************************/
        loginView.delegate = self
        self.view.addSubview(loginView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

/******************************协议实现---点击事件⑤**********************************/
extension LoginViewController: LoginBasic_ViewProtocol {
    
        func URL_buttonAction(sender: UIButton) {
            print("访问地址---URL_buttonAction---  :LoginViewController")
        }
    
        func rememberPasswordAction(sender: UIButton) {
            sender.isSelected = !sender.isSelected
            if sender.isSelected == true {
                print("选中---记住密码---rememberPasswordAction---  :LoginViewController")
            }else {
                print("取消---记住密码---rememberPasswordAction---  :LoginViewController")
            }
        }
    
        func autoLoginAction(sender: UIButton) {
            sender.isSelected = !sender.isSelected
            if sender.isSelected == true {
                print("选中---自动登录---autoLoginAction---  :LoginViewController")
            }else {
                print("取消---自动登录---autoLoginAction---  :LoginViewController")
            }
        }
    
        func loginClickAction(sender: UIButton) {
            print("登录---loginClickAction---  :LoginViewController")
            self.present(MainTabBarViewController.init(), animated: true, completion: nil)
        }

}
