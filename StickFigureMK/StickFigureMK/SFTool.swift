//
//  SFTool.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/9/28.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import Foundation
class SFTool: NSObject {
    public func sfColor(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
        let color = UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
        return color
        
    }
}
