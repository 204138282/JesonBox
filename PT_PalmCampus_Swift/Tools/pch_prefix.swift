//
//  pch_prefix.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/12.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

///view宽高
let KWIDTH = UIScreen.main.bounds.width
let KHEIGHT = UIScreen.main.bounds.height

///随机色
let ARC4RANDOM_COLOR = UIColor.init(red: CGFloat(arc4random_uniform(255)) / CGFloat(255.0), green: CGFloat(arc4random_uniform(255)) / CGFloat(255.0), blue: CGFloat(arc4random_uniform(255)) / CGFloat(255.0), alpha: CGFloat(arc4random_uniform(255)) / CGFloat(255.0))

///RGBA色
extension UIColor {
    class func RGBA_COLOR(red_c:CGFloat, green_c: CGFloat, blue_c: CGFloat, alpha_c: CGFloat) -> UIColor {
        let color = UIColor.init(red: red_c / 255.0, green: green_c / 255.0, blue: blue_c / 255.0, alpha: alpha_c)
        return color
    }
}

///弹框
extension UIAlertController {
    class func TIP_ALERT(alertTitle: String, alertMessage: String, alertStyle: UIAlertControllerStyle, viewController: UIViewController){
        let alertC = UIAlertController.init(title: alertTitle, message: alertMessage, preferredStyle: alertStyle)
        let cancelAction: UIAlertAction = UIAlertAction.init(title: "cancel", style: .cancel) { (action) in
            print("已点击---cancel")
        }
        let sureAction: UIAlertAction = UIAlertAction.init(title: "sure", style: .default) { (action) in
            print("已点击---sure")
        }
        alertC.addAction(cancelAction)
        alertC.addAction(sureAction)
    }
    //在使用的地方----调用方法
    //  UIAlertController.TIP_Alert(alertTitle: String, alertMessage: String, alertStyle: UIAlertControllerStyle, viewController: UIViewController)
}

extension UserDefaults {
    /**
     * 存储数据
     *
     */
    func saveWithNSUserDefaults(key: String, value: String) {
        // 1、利用NSUserDefaults存储数据
        let defaults = UserDefaults.standard
        // 2、存储数据
        defaults.setValue(value, forKey: key)
        // 3、同步数据
        defaults.synchronize()
    }
    
}
