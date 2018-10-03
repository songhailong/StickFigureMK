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
    func shareHttpTool() -> JBhttpTool {
        let insatance:JBhttpTool=JBhttpTool()
        return insatance
    }
    
    
    
    class   func POSTRequst(url:String,patams:NSDictionary,sucessBlock:@escaping (_ responseObject:Any)->(),failBlock:@escaping (_ errr:Error)->()) {
    let afmanger = AFHTTPSessionManager.init()
    afmanger.post(url, parameters: patams, progress: { (progress:Progress) in
        
    }, success: { (task:URLSessionDataTask, objet:Any?) in
        sucessBlock(objet ?? nil!)
    }) { (task:URLSessionDataTask?, errr:Error) in
        failBlock(errr)
    }
    
    }
}
