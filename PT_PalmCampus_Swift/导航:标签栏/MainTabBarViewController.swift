//
//  MainTabBarViewController.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 2017/3/12.
//  Copyright © 2017年 Kbird. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.__addChildVC()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func __addChildVC(){
        let homeVC = HomeViewController.init()
        let myVC = MyViewController.init()
        self.__setTabBar(homeVC, tabBarTitle: "首页", navTitle: "首页", image: #imageLiteral(resourceName: "icon13"), selectedImage: #imageLiteral(resourceName: "icon13"))
        self.__setTabBar(myVC, tabBarTitle: "我的", navTitle: "我的", image: #imageLiteral(resourceName: "icon15"), selectedImage: #imageLiteral(resourceName: "icon15"))
    }

    //  MARK: - - 设置标签栏
    func __setTabBar (_ childVC: UIViewController, tabBarTitle: String, navTitle: String, image: UIImage, selectedImage: UIImage) -> () {
        childVC.navigationController?.view.backgroundColor = UIColor.white
        childVC.navigationController?.navigationBar.tintColor = UIColor.white
        childVC.tabBarItem.title = tabBarTitle
        childVC.title = navTitle
        childVC.tabBarItem.image = image.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
        let navigationC: UINavigationController = UINavigationController.init(rootViewController: childVC)
        self.addChildViewController(navigationC)
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
