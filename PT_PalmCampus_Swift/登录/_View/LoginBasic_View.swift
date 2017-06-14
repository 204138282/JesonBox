//
//  LoginBasic_View.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/24.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class LoginBasic_View: UIView {
    
    /******************************协议实现---点击事件②**********************************/
    var delegate: LoginBasic_ViewProtocol! = nil
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let loginVC = LoginViewController()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "piclogin")!)
        self.addSubview(URL_button)
        self.addSubview(head_imageView)
        self.addSubview(user_textField)
        self.addSubview(password_textField)
        self.addSubview(rememberPwd_button)
        self.addSubview(autoLogin_button)
        self.addSubview(login_button)
        self.addSubview(shiyue_label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///访问地址
    lazy var URL_button: UIButton = {
        let button = UIButton.init(type: UIButtonType.custom)
        button.setImage(#imageLiteral(resourceName: "venues_bell"), for: .normal)
        button.frame = CGRect.init(x: KWIDTH - 40, y: 44, width: 25, height: 25)
        button.layer.cornerRadius = 12.5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(URL_buttonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    ///头像
    lazy var head_imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.init(x: KWIDTH / 2 - 45, y: 64 + 10, width: 90, height: 90))
        imageView.image = #imageLiteral(resourceName: "Miku_fly")
        imageView.layer.borderColor = UIColor.yellow.cgColor
        imageView.layer.borderWidth = 1.0
        imageView.layer.cornerRadius = 45.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    ///帐户：
    lazy var user_textField: UITextField = {
        
        let left_view = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 50 / 2, height: 50 / 2))
        left_view.image = #imageLiteral(resourceName: "login_name")
        let textField = UITextField.init(frame: CGRect.init(x: 30, y: self.head_imageView.y + self.head_imageView.height + 50, width: KWIDTH - 60 , height: 50))
        textField.backgroundColor = UIColor.RGBA_COLOR(red_c: 232, green_c: 232, blue_c: 232, alpha_c: 0.5)
        textField.placeholder = "请输入用户名"
        textField.textColor = UIColor.white
//        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.leftView = left_view
        textField.leftViewMode = .always
        return textField
    }()
    
    ///密码：
    lazy var password_textField: UITextField = {
        
        let left_view = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 50 / 2, height: 50 / 2))
        left_view.image = #imageLiteral(resourceName: "login_pwd")
        let textField = UITextField.init(frame: CGRect.init(x: self.user_textField.x, y: self.user_textField.y + self.user_textField.height+1, width: self.user_textField.width, height: self.user_textField.height))
        textField.backgroundColor = UIColor.RGBA_COLOR(red_c: 232, green_c: 232, blue_c: 232, alpha_c: 0.5)
        textField.placeholder = "请输入密码"
        textField.isSecureTextEntry = true
        textField.textColor = UIColor.white
//        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.leftView = left_view
        textField.leftViewMode = .always
        return textField
    }()
    
    ///记住密码
    lazy var rememberPwd_button: UIButton = {
       let button = UIButton.init(type: UIButtonType.custom)
        button.frame = CGRect.init(x: self.password_textField.x + 20, y: self.password_textField.y + self.password_textField.height + 25, width: 100, height: 20)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setImage(#imageLiteral(resourceName: "nochoose"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "choose"), for: .selected)
        button.setTitle("记住密码", for: .normal)
        button.addTarget(self, action: #selector(rememberPasswordAction(sender:)), for: .touchUpInside)
        return button
    }()
    ///自动登录
    lazy var autoLogin_button: UIButton = {
        let button = UIButton.init(type: UIButtonType.custom)
        button.frame = CGRect.init(x: self.password_textField.x + self.password_textField.width - 120, y: self.password_textField.y + self.password_textField.height + 25, width: 100, height: 20)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setImage(#imageLiteral(resourceName: "nochoose"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "choose"), for: .selected)
        button.setTitle("自动登录", for: .normal)
        button.addTarget(self, action: #selector(autoLoginAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    ///登录
    lazy var login_button: UIButton = {
        let button = UIButton.init(type: UIButtonType.custom)
        button.frame = CGRect.init(x: 20, y: self.autoLogin_button.y + self.autoLogin_button.height + 30, width: KWIDTH - 40, height: 50)
        button.setTitle("登录", for: .normal)
        button.backgroundColor = UIColor.RGBA_COLOR(red_c: 20, green_c: 155, blue_c: 241, alpha_c: 1.0)
        button.layer.cornerRadius = 2.0
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(loginClickAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    ///欢迎使用师悦掌上校园
    lazy var shiyue_label: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: self.login_button.y + self.login_button.height + 100, width: KWIDTH, height: 20))
        label.text = "欢迎使用师悦掌上校园"
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    /******************************协议实现---点击事件①**********************************/
    func URL_buttonAction(sender: UIButton) {
        delegate?.URL_buttonAction(sender: sender)
    }
    func rememberPasswordAction(sender: UIButton) {
        delegate?.rememberPasswordAction(sender: sender)
    }
    func autoLoginAction(sender: UIButton) {
        delegate?.autoLoginAction(sender: sender)
    }
    func loginClickAction(sender: UIButton) {
        delegate?.loginClickAction(sender: sender)
    }
}

/******************************协议实现---点击事件③**********************************/
protocol LoginBasic_ViewProtocol {
    func URL_buttonAction(sender: UIButton)         //设置访问地址
    func rememberPasswordAction(sender: UIButton)   //记住密码
    func autoLoginAction(sender: UIButton)          //自动登录
    func loginClickAction(sender: UIButton)         //登录------I/O
}

