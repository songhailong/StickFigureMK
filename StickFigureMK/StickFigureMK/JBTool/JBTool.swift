//
//  JBTool.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/8.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

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
    
    func isSMSCode(strCode:String) -> Bool {
        let pattern = "^[0-9]+$"
        if NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self) {
            
            return true
            
        }
        return false
            
        
     
    }
    
    
}
