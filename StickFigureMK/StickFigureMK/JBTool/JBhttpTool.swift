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
          let systemName = UIDevice.current.name
 
        let touchname="Mozilla/5.0 (\(systemName)) Gecko/20100101 Firefox/60.0"
        afmanger.requestSerializer.setValue(touchname, forHTTPHeaderField: "User-Agent");
    afmanger.post(url, parameters: patams, progress: { (progress:Progress) in
        
    }, success: { (task:URLSessionDataTask, responseObject:Any?) in
         let json = JBTool.nsdataToJSON(data: responseObject as! NSData)
        let  sucessu =  json.object(forKey: "success")as! Bool
        if sucessu{
           sucessBlock(responseObject ?? nil!)
        }else{
            JBProgressHUD.showMessage(message: json.object(forKey: "msg") as! String)
        }
        
    
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
