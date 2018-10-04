//
//  UserManger.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/3.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class UserManger: NSObject {
    var IsLogin:Bool=false
    var userid:String?
    var userName:String?
    var headImg:String?
    var URI:String?
    var sessionId:String?
    var aesKey:String?
    static let usermanger:UserManger=UserManger()
    /**创建单例*/
    class  func shareUserManger() -> UserManger {
        
     usermanger.loadUserInfoFormSannbox()
        return .usermanger
    }
    
  private  func loadUserInfoFormSannbox()  {
        //let userdef: = <#value#>
      let def:UserDefaults=UserDefaults.standard
    /*这个主意*/
    IsLogin=(def.object(forKey:"IsLogin") != nil)
    userid=def.object(forKey: "userid") as? String
    userName=def.object(forKey: "userName") as? String
    headImg=def.object(forKey: "headImg") as? String
    URI=def.object(forKey: "URI") as? String
    sessionId=def.object(forKey: "sessionId") as? String
    aesKey=def.object(forKey: "aesKey") as? String
    
    }
    func setDictionary(dic:NSDictionary)  {
        let def:UserDefaults=UserDefaults.standard
        def.set(dic.object(forKey:"userid"), forKey: "userid")
        def.set(dic.object(forKey: "userName"), forKey: "userName")
        def.set(dic.object(forKey: "headImg"), forKey: "headImg")
        def.set(dic.object(forKey: "URI"), forKey: "URI")
        def.set(dic.object(forKey: "sessionId"), forKey:"sessionId")
        def.set(dic.object(forKey: "aesKey"), forKey: "aesKey")
        def.set(true, forKey: "IsLogin")
    }
    
    
    
    func logout()  {
        let def:UserDefaults=UserDefaults.standard
        def.removeObject(forKey:"userid")
        def.removeObject(forKey: "userName")
        def.removeObject(forKey: "headImg")
        def.removeObject(forKey: "URI")
        def.removeObject(forKey: "sessionId")
        def.removeObject(forKey: "aesKey")
        def.removeObject(forKey: "IsLogin")
    }

    
    
}
