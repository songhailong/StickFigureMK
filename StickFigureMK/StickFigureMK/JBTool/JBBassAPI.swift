//
//  JBBassAPI.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/4.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

enum PortType {
    case login //登录接口
    case Regist //注册
    case SMSCode //获取短信验证码
}

class JBBassAPI: NSObject {
    //测试库
   static let bassAPI = "http://192.168.0.8:8080/simplemd/"
    //正式库
   // let  bassAPI = "http://192.168.0.8:8080"
    
  static  let URL_POST_LOGIN="simplemd"
  static let URL_POST_REGIST="registered"
   static let URL_POST_SMSCODE="smsCodeRequest"
  class  func registAPI(portType:PortType) -> String {
    var url = String.init(bassAPI)
    
        switch portType {
        case .login:
            url.append(URL_POST_LOGIN)
            break
        case .Regist:
            url.append(contentsOf: URL_POST_REGIST)
            break
        case .SMSCode:
            url.append(contentsOf: URL_POST_SMSCODE)
            break
            
        default:
            
           break
        }
    
      return url
    
    }
    
    
}
