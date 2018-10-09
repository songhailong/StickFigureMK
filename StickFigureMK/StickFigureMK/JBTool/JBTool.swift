//
//  JBTool.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/8.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import CommonCrypto
enum IphoneType {
   
}


class JBTool: NSObject {
  class  func isPhoneNumber(strNumber:String) -> Bool {
        let mobile = "^1((3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$)"
        
        let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
        
        let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
        
        let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
        
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        
        if ((regextestmobile.evaluate(with: strNumber) == true)
            
            || (regextestcm.evaluate(with: strNumber)  == true)
            
            || (regextestct.evaluate(with: strNumber) == true)
            
            || (regextestcu.evaluate(with: strNumber) == true))
            
        {
            
            return true
            
        }
            
        else
            
        {
            
            return false
            
        }
        
    }
    
 class   func isSMSCode(strCode:String) -> Bool {
        let pattern = "^\\d{6}$"
        if NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self) {
            
            return true
            
        }
        return false
            
        
     
    }
    
    
    
 class  func MD5String(str:String) -> String {
        let cStr = str.cString(using: String.Encoding.utf8)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        
        let md5String = NSMutableString()
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
            
        }
        free(buffer)
        
        return md5String as String
        }
    func changeCharcter (chNum:Character) -> Character {
        //将字符转成整数
        
        var chStr = String(chNum)   //将字符转成字符串
        var num:UInt32 = 0  //用于接受字符整数值的变量
        for item in chStr.unicodeScalars {
            num = item.value    //循环只执行一次,获取字符的整数的值
            
        }
        /*
         如果是大小写字母,转换数值
         */
        //如果是大写字母
        if num >= 65 && num <= 90 {
            num += 32
        }
            //如果是小写字母
        else if num >= 97 && num <= 122 {
            num -= 32
        }
        /*
         将整数转换为字符
         */
        let newChNum = Character(UnicodeScalar(num)!)
        return newChNum
        
    }
  class func changeAcapital(str:String) -> String {
        var sttt:String=String()
        var i = 0   //表示偏移量(循环变量初始值)
        while i < str.count {    //循环条件,包含循环变量的终止值
            let str1 = str[str.index(str.startIndex, offsetBy: i)]
            //    str1 = changeCharcter(chNum: str1)
            //var chat = str[i]
            
           print(str1)
            //str.replaceSubrange(str.index(str.startIndex, offsetBy:
//                i)...str.index(str.startIndex, offsetBy: i),
//                                with: String(changeCharcter(chNum: str1)))
            let jbtool =  JBTool.init()
          
        sttt.append(jbtool.changeCharcter(chNum:str1))
            i+=1   //循环变量值变化
        }
        
       
       return sttt
       
    }
  class  func nsdataToJSON(data: NSData) ->NSDictionary{
        do {
            return try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as! NSDictionary
        } catch {
            print(error)
        }
        return NSDictionary.init()
    }
    
    
    
   
    
}
