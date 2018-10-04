//
//  JBhttpTool.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/3.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import AFNetworking
class JBhttpTool: NSObject {
   static  let _insatance=AFHTTPSessionManager()
  class  func shareHttpTool() -> AFHTTPSessionManager {
        _insatance.responseSerializer=AFHTTPResponseSerializer.init()
        _insatance.requestSerializer.timeoutInterval=30.0
        return _insatance
        
        
        
    }
    
    /**post 请求*/
    
    class  func POSTRequst(url:String,patams:NSDictionary,sucessBlock:@escaping (_ responseObject:Any)->(),failBlock:@escaping (_ errr:Error)->()) {
    let afmanger = JBhttpTool.shareHttpTool()
    afmanger.post(url, parameters: patams, progress: { (progress:Progress) in
        
    }, success: { (task:URLSessionDataTask, responseObject:Any?) in
        sucessBlock(responseObject ?? nil!)
    }) { (task:URLSessionDataTask?, errr:Error) in
        failBlock(errr)
    }
    
    }
    
    /**get请求*/
    class   func GETRequst(url:String,patams:NSDictionary,sucessBlock:@escaping (_ responseObject:Any)->(),failBlock:@escaping (_ error:Error)->())  {
        let afmanger = JBhttpTool.shareHttpTool()
        afmanger.get(url, parameters: patams, progress: { (progress:Progress) in
            
        }, success: { (task:URLSessionDataTask,responseObject:Any ) in
            sucessBlock(responseObject)
        }) { (task:URLSessionDataTask?, error:Error) in
            failBlock(error)
        }
    }
    
   
  class  func setHttpHeadField(value:String,key:String)  {
        let afmanger = JBhttpTool.shareHttpTool()
        afmanger.requestSerializer.setValue(value, forHTTPHeaderField: key)
    }
    
    
    
    
    
}
