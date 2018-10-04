//
//  JBLoginViewController.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/3.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class JBLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        setupaUI()
     }
    
    func setupaUI()  {
        let iconView=UIImageView()
        iconView.image=UIImage.init(named: "详情头像")
        self.view.addSubview(iconView)
        let loginBtn=UIButton()
        loginBtn.setTitle("登录", for: UIControlState.normal)
        loginBtn.addTarget(self, action: #selector(loginAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(loginBtn)
        
    }
    /**登录请求*/
 @objc  func loginAction()  {
        
    }
    
    /**懒加载*/
    lazy var registBtn:UIButton={
       let registB=UIButton()
        return registB
    }()
    lazy var forgetPassWBtn:UIButton={
       let pwBtn=UIButton()
        return pwBtn
    }()
    
    lazy var textFildeName:UITextField={
        let textfilede=UITextField()
        textfilede.delegate=self
        return textfilede
    }()
    lazy var textfilePassWord:UITextField={
       let textfileP=UITextField()
        textfileP.delegate=self;
        return textfileP
    }()
    

}
extension JBLoginViewController:UITextFieldDelegate {
    
}
