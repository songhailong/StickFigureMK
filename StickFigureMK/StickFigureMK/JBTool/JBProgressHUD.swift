//
//  JBProgressHUD.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/4.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import SVProgressHUD
class JBProgressHUD: SVProgressHUD {
    /**显示文字*/
 class   func showMessage(message:String)  {
        //设置成黑色
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
        SVProgressHUD.show(UIImage.init(), status: message)
    }
    
 /**
     显示成功信息
     */
 class   func showSuceessText(text:String){
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
     SVProgressHUD.setSuccessImage(UIImage.init(named:"HUD_success")!)
        SVProgressHUD.showSuccess(withStatus:text)
    }
    /**加载提示框*/
    class  func showLoadingWithText(text:String){
        //加载动画小菊花
 SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
    SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
    SVProgressHUD.show(withStatus: text)
    
    }
    /**只有小菊花的加载*/
  class   func showloadingNative()  {
 SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
        SVProgressHUD.show()
    }
    /**消失*/
  class  func dissLoading()  {
        SVProgressHUD.dismiss()
    }
    

}
