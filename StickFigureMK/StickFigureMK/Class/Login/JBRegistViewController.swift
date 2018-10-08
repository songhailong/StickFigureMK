//
//  JBRegistViewController.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/3.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class JBRegistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.isHidden=true
        self.view.backgroundColor=UIColor.white
        setupUI()
    }
    
private   func setupUI()  {
       self.view.addSubview(self.passWordFilde)
       self.view.addSubview(registBtn)
       self.view.addSubview(validationBtn)
       self.view.addSubview(codeTextFilde)
       self.view.addSubview(numberTextFile)
    numberTextFile.mas_makeConstraints { (mask:MASConstraintMaker!) in
        mask.top.mas_equalTo()(5+84)
        mask.left.mas_equalTo()(30)
        mask.right.mas_equalTo()(-30)
        mask.height.mas_equalTo()(60)
    }
    codeTextFilde.mas_makeConstraints { (mask:MASConstraintMaker!) in
        mask.top.equalTo()(numberTextFile.mas_bottom)?.offset()(10)
        mask.left.mas_equalTo()(30)
        mask.right.equalTo()(validationBtn.mas_left)?.offset()(-20)
        mask.height.mas_equalTo()(60)
    }
    passWordFilde.mas_makeConstraints { (mask:MASConstraintMaker!) in
        mask.top.equalTo()(codeTextFilde.mas_bottom)?.offset()(10)
        mask.left.mas_equalTo()(30)
        mask.right.mas_equalTo()(-30)
        mask.height.mas_equalTo()(60)
    }
    registBtn.mas_makeConstraints { (mask:MASConstraintMaker!) in
        mask.top.equalTo()(passWordFilde.mas_bottom)?.offset()(10)
        mask.left.mas_equalTo()(30)
        mask.right.mas_equalTo()(-30)
        mask.height.mas_equalTo()(60)
    }
    validationBtn.mas_makeConstraints { (mask:MASConstraintMaker!) in
        mask.top.equalTo()(numberTextFile.mas_bottom)?.offset()(10)
        mask.left.equalTo()(codeTextFilde.mas_right)?.offset()(20)
        mask.right.mas_equalTo()(-30)
        mask.height.mas_equalTo()(60)
    }
    
    }
    
    
    
    @objc func getCoad(btn:UIButton) {
        if btn.isSelected==false{
            return
        }
        if JBTool.isPhoneNumber(strNumber: self.numberTextFile.text!){
            let regisDic=JBBassDictionary.initJBDic()
            regisDic.setValue(self.numberTextFile.text, forKey: "phone")
            regisDic.setValue(self.codeTextFilde.text, forKey: "smsCode")
            regisDic.setValue(self.passWordFilde.text, forKey: "password")
            let url=JBBassAPI.registAPI(portType: .SMSCode)
            JBhttpTool.POSTRequst(url: url, patams: regisDic, sucessBlock: { (object) in
                
            }) { (errr) in
                
            }
        }else{
            JBProgressHUD.showMessage(message: "请填写正确的手机号")
        }
    }
    @objc  func registAction(btn:UIButton)  {
        if btn.isSelected==false {
           return
        }
    let regisDic=JBBassDictionary.initJBDic()
      regisDic.setValue(self.numberTextFile.text, forKey: "phone")
    regisDic.setValue(self.codeTextFilde.text, forKey: "smsCode")
    regisDic.setValue(self.passWordFilde.text, forKey: "password")
     let url=JBBassAPI.registAPI(portType: PortType.Regist)
        JBhttpTool.POSTRequst(url: url, patams: regisDic, sucessBlock:{ (object) in
            JBProgressHUD.dismiss()
        }) { (errr) in
            
        }
    
    
    }
    func dispatchTimer()  {
        
        
        
        
    }
    
    
   /**懒加载*/
    lazy  var passWordFilde:UITextField={
        let textfile1=UITextField()
        textfile1.delegate=self
        textfile1.placeholder="输入密码"
        textfile1.font=UIFont.systemFont(ofSize: 21)
        textfile1.borderStyle=UITextBorderStyle.roundedRect
        textfile1.keyboardType=UIKeyboardType.default
  
        return textfile1
    }()
    lazy var codeTextFilde:UITextField={
        let textfile2=UITextField()
        textfile2.delegate=self
        textfile2.placeholder="输入验证码"
        textfile2.font=UIFont.systemFont(ofSize: 21)
        textfile2.borderStyle=UITextBorderStyle.roundedRect
        textfile2.keyboardType=UIKeyboardType.numberPad
        return textfile2
    }()
    
    lazy var numberTextFile:UITextField={
       let textfile=UITextField()
        textfile.delegate=self
        textfile.placeholder="请输入手机号"
        textfile.font=UIFont.systemFont(ofSize: 21)
        textfile.borderStyle=UITextBorderStyle.roundedRect
        textfile.keyboardType=UIKeyboardType.numberPad
        //设置左视图类型
//        textfile.leftViewMode=UITextFieldViewMode.always
//        let leftimageview=UIImageView.init(frame: CGRect.init(x: 20, y: 20, width: 40, height: 40))
//        leftimageview.image=UIImage.init(named:"头像")
//        textfilede.leftView=leftimageview
//        textfilede.clearButtonMode=UITextFieldViewMode.whileEditing
//
//        let rightImageView=UIImageView.init(image: UIImage.init(named: "删除-X"))
//        textfilede.rightView=rightImageView;
//        textfilede.rightViewMode=UITextFieldViewMode.whileEditing
       return textfile
    }()
    
    
    lazy var validationBtn:UIButton={
       let bt=UIButton()
        bt.setTitle("获取验证码", for: UIControlState.normal)
        //bt.setTitle(, for: <#T##UIControlState#>)
        bt.isSelected=true
        //bt.layer.borderWidth=2
        bt.setTitleColor(JBRGBColor.JBRGB(r: 211, g: 211, b: 213), for: UIControlState.selected)
        bt.setTitleColor(JBRGBColor.JBMainColor(), for: UIControlState.normal)
        bt.addTarget(self
            , action:#selector(getCoad), for: UIControlEvents.touchUpInside)
      return bt
    }()
    
    lazy var registBtn:UIButton={
       let registBtn=UIButton()
        registBtn.setTitle("注册用户", for: UIControlState.normal)
        registBtn.backgroundColor=JBRGBColor.JBMainColor()
        registBtn.addTarget(self
            , action: #selector(registAction), for: UIControlEvents.touchUpInside)
        return registBtn;
    }()
    
}
extension JBRegistViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        validationBtn.isSelected=false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        validationBtn.isSelected=false
    }
}
