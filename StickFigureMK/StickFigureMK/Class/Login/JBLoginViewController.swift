//
//  JBLoginViewController.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/3.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class JBLoginViewController: UIViewController {
    let  loginBtn:UIButton=UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden=true
        self.view.backgroundColor=UIColor.white
        setupaUI()
     }
    
    func setupaUI()  {
        let iconView=UIImageView()
        iconView.image=UIImage.init(named: "详情头像")
        self.view.addSubview(iconView)
        self.view.addSubview(textfilePassWord)
        self.view.addSubview(textFildeName)
        self.view.addSubview(registBtn)
        self.view.addSubview(forgetPassWBtn)
        iconView.isUserInteractionEnabled=true
        iconView.isOpaque=true
        print(self.view.frame)
       iconView.layer.cornerRadius=50
        //let with=750.0
        iconView.mas_makeConstraints { (mask:MASConstraintMaker!) in
            mask.bottom.equalTo()(textFildeName.mas_top)?.offset()(-80)
            mask.centerX.equalTo()(self.view)
            mask.height.mas_equalTo()(100)
            mask.width.mas_equalTo()(100)
        }
        
        loginBtn.setTitle("登录", for: UIControlState.normal)
        loginBtn.backgroundColor=JBRGBColor.JBRGB(r: 73, g: 108, b: 239)
        loginBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        loginBtn.addTarget(self, action: #selector(loginAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(loginBtn)
        loginBtn.mas_makeConstraints { (mask:MASConstraintMaker!) in
            mask.left.mas_equalTo()(40)
            mask.right.mas_equalTo()(-40)
            mask.top.equalTo()(textfilePassWord.mas_bottom)?.offset()(30)
            mask.height.mas_equalTo()(60)
        }
        
        p_layoutViews()
    }
    /**登录请求*/
  @objc  func loginAction()  {
        
    }
    /**适配*/
  private   func  p_layoutViews(){
    
    textFildeName.mas_makeConstraints { (mask:MASConstraintMaker!) in
        mask.left.mas_equalTo()(40)
        mask.right.mas_equalTo()(-40)
        mask.top.mas_equalTo()(400)
        mask.height.mas_equalTo()(80)
    }
    textfilePassWord.mas_makeConstraints { (mask:MASConstraintMaker!) in
        mask.left.mas_equalTo()(40)
        mask.right.mas_equalTo()(-40)
        mask.top.equalTo()(textFildeName.mas_bottom)?.offset()(0)
        mask.height.mas_equalTo()(80)
    }
    registBtn.mas_makeConstraints { (mask:MASConstraintMaker!) in
        mask.left.mas_equalTo()(40)
        mask.top.equalTo()(loginBtn.mas_bottom)?.offset()(20)
        mask.width.mas_equalTo()(150)
        mask.height.mas_equalTo()(50)
    }
    forgetPassWBtn.mas_makeConstraints { (mask:MASConstraintMaker!) in
        mask.right.mas_equalTo()(-40)
        mask.top.equalTo()(loginBtn.mas_bottom)?.offset()(20)
        mask.width.mas_equalTo()(150)
        mask.height.mas_equalTo()(50)
    }
    
    
    
    }
    //注册按钮
  @objc  func registAction() {
       self.navigationController?.pushViewController(JBRegistViewController(), animated: true)
    }
    
  @objc  func forgetPassAction()  {
        
    }
    
    
    /**懒加载*/
    lazy var registBtn:UIButton={
       let registB=UIButton()
        registB.setTitle("立即注册", for: UIControlState.normal)
        registB.setTitleColor(JBRGBColor.JBRGB(r: 182, g: 182, b: 182), for: UIControlState.normal)
        registB.backgroundColor=UIColor.red
       registB.titleLabel?.font=UIFont.systemFont(ofSize: 20)
        registB.titleLabel?.textAlignment=NSTextAlignment.left
        registB.addTarget(self, action: #selector(registAction), for: UIControlEvents.touchUpInside)
        return registB
    }()
    lazy var forgetPassWBtn:UIButton={
       let pwBtn=UIButton()
        
        pwBtn.setTitle("忘记密码？", for: UIControlState.normal)
        pwBtn.setTitleColor(JBRGBColor.JBRGB(r: 73, g: 108, b: 239), for: UIControlState.normal)
        pwBtn.titleLabel?.font=UIFont.systemFont(ofSize: 20)
        pwBtn.titleLabel?.textAlignment=NSTextAlignment.right
        pwBtn.addTarget(self, action: #selector(forgetPassAction), for: UIControlEvents.touchUpInside)
        
        return pwBtn
    }()
    
    lazy var textFildeName:UITextField={
        let textfilede=UITextField()
        textfilede.delegate=self
        textfilede.placeholder="请输入账号"
        textfilede.font=UIFont.systemFont(ofSize: 21)
        textfilede.borderStyle=UITextBorderStyle.roundedRect
        textfilede.keyboardType=UIKeyboardType.numberPad
        //设置左视图类型
        textfilede.leftViewMode=UITextFieldViewMode.always
     let leftimageview=UIImageView.init(frame: CGRect.init(x: 20, y: 20, width: 40, height: 40))
        leftimageview.image=UIImage.init(named:"头像")
        textfilede.leftView=leftimageview
        textfilede.clearButtonMode=UITextFieldViewMode.whileEditing
    
        let rightImageView=UIImageView.init(image: UIImage.init(named: "删除-X"))
        textfilede.rightView=rightImageView;
         textfilede.rightViewMode=UITextFieldViewMode.whileEditing
        return textfilede
    }()
    lazy var textfilePassWord:UITextField={
       let textfileP=UITextField()
        textfileP.delegate=self;
        textfileP.placeholder="请输入密码"
        //是否密码样式
        textfileP.isSecureTextEntry=true
        textfileP.borderStyle=UITextBorderStyle.roundedRect
        textfileP.keyboardType=UIKeyboardType.default
        textfileP.font=UIFont.systemFont(ofSize: 21)
        //设置左视图类型
       textfileP.leftViewMode=UITextFieldViewMode.always
        let leftimageview=UIImageView.init(frame: CGRect.init(x: 20, y: 20, width: 40, height: 40))
        leftimageview.image=UIImage.init(named:"密码锁")
       textfileP.leftView=leftimageview
        textfileP.clearButtonMode=UITextFieldViewMode.whileEditing
        
        let rightImageView=UIImageView.init(image: UIImage.init(named: "删除-X"))
        textfileP.rightView=rightImageView;
        textfileP.rightViewMode=UITextFieldViewMode.whileEditing
        return textfileP
    }()
    

}
extension JBLoginViewController:UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
