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
     let navItem=UINavigationItem.init(title: "注册账号")
        let leftitem = UIBarButtonItem.init(image: UIImage.init(named: "返回"), style:UIBarButtonItemStyle.done, target: self, action:#selector (leftAction))
        navItem.title="注册账号"
        navItem.setLeftBarButton(leftitem, animated: false)
      self.navigationController?.navigationItem.leftBarButtonItem=leftitem
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
    
    
    /**获取验证码*/
    @objc func getCoad(btn:UIButton) {
        print("获取验证码")
        if btn.isSelected==true{
            return
        }
        //JBhttpTool.setHttpHeadField(value: "", key: <#T##String#>)
        if JBTool.isPhoneNumber(strNumber: self.numberTextFile.text!){
            let regisDic=JBBassDictionary.initJBDic()
            regisDic.setValue(self.numberTextFile.text, forKey: "phone")
            //regisDic.setValue(self.codeTextFilde.text, forKey: "smsCode")
            //regisDic.setValue(self.passWordFilde.text, forKey: "password")
            
            let url=JBBassAPI.registAPI(portType: .SMSCode)
            print(url)
            JBhttpTool.POSTRequst(url: url, patams: regisDic, sucessBlock: { (object) in
                let json = JBTool.nsdataToJSON(data: object as! NSData)
                let  sucessu =  json.object(forKey: "success")as! Bool
                if sucessu{
                     JBProgressHUD.showMessage(message: json.object(forKey: "msg") as! String)
                    self.dispatchTimer()
                }else{
                    JBProgressHUD.showMessage(message: json.object(forKey: "msg") as! String)
                }
                print(json)
            }) { (error) in
                JBProgressHUD.showMessage(message: "网速欠佳")
            }
        }else{
            JBProgressHUD.showMessage(message: "请填写正确的手机号")
        }
    }
    /**注册*/
    @objc  func registAction(btn:UIButton)  {
        print("注册按钮")
        if btn.isSelected==true {
           return
        }
    let regisDic=JBBassDictionary.initJBDic()
      regisDic.setValue(self.numberTextFile.text, forKey: "phone")
    regisDic.setValue(self.codeTextFilde.text, forKey: "smsCode")
    let passmd5 = JBTool.MD5String(str: self.passWordFilde.text!)
    let capitalpass=JBTool.changeAcapital(str: passmd5)
    let password = JBTool.MD5String(str: capitalpass)
    let md5Passowrd=JBTool.changeAcapital(str: password)
    regisDic.setValue(md5Passowrd, forKey: "password")
     let url=JBBassAPI.registAPI(portType: PortType.Regist)
        JBhttpTool.POSTRequst(url: url, patams: regisDic, sucessBlock:{ (object) in
            JBProgressHUD.dismiss()
        }) { (errr) in
            JBProgressHUD.showMessage(message: "网速欠佳")
        }
    
    
    }
    func dispatchTimer()  {
        var tiemCount=60
    MCGCDTimer.shared.scheduledDispatchTimer(WithTimerName: "GCDTimer", timeInterval: 1, queue: DispatchQueue.main, repeats: true) {
            tiemCount-=1
        
        if tiemCount==0{
             MCGCDTimer.shared.cancleTimer(WithTimerName: "GCDTimer")
             self.validationBtn.setTitle("重新发送", for: UIControlState.normal)
            self.validationBtn.isSelected=false
        }else{
        self.validationBtn.setTitle("\(tiemCount)秒后重发", for: UIControlState.normal)
            self.validationBtn.isSelected=true
        }
        }
        
        
    }
    
  @objc  func leftAction()  {
        self.navigationController?.popViewController(animated: true)
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
        textfile.isSecureTextEntry=true
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
        registBtn.backgroundColor=JBRGBColor.JBRGB(r: 211, g: 211, b: 213)
        registBtn.isSelected=false
        registBtn.addTarget(self
            , action: #selector(registAction), for: UIControlEvents.touchUpInside)
        return registBtn;
    }()
    
}
extension JBRegistViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if passWordFilde.text != nil {
            registBtn.isSelected=false
            registBtn.backgroundColor=JBRGBColor.JBMainColor()
        }
        
        
        validationBtn.isSelected=false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        validationBtn.isSelected=false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
//    func textfiel(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
}
