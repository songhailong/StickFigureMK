//
//  JBRGBColor.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/5.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import CommonCrypto
class JBRGBColor: UIColor {
  class func JBRGB(r:Float,g:Float,b:Float) ->UIColor {
        return UIColor.init(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: 1)
    }
    
  class  func JBMainColor() -> UIColor {
         return UIColor.init(red: CGFloat(34/255.0), green: CGFloat(139/255.0), blue: CGFloat(34/255.0), alpha: 1)
    }
    
    func MD5String(str:String) -> String {
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
    
    
}
