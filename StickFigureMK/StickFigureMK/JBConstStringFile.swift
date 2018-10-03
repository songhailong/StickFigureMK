//
//  JBConstStringFile.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/3.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import Foundation
/**标题1 # */
let H1:String="#"
/**标题2 ## */
let H2:String="##"
/**标题3 ### */
let H3:String="###"
/**链接 []()*/
public  let LINK={(utl:String, name:String)->String in
    return "[\(name)](\(utl))"
}
/**加粗 *n加粗内容 * */
public let BOLD={(text:String)->String in
    return"**\(text)**"
}
/*无序列表 * \(text)   中间有空格*/
public let LIST={(text:String)->String in
    return "* \(text)*"
}
/**代码块 (```) 代码(```) */
public let CODE="(```)\n(```)"
/**图片    ![图片名字](链接)*/
public let IMAGE={(imageTitle:String,imageUrll:String)->String in
    return "![\(imageTitle)](\(imageUrll))"
}
/**分割线   ----  */
let DIVIDER:String = "---"
/**斜体*/
public let ITALICS={(italicsText:String)->String in
    return "*\(italicsText)*"
}

/**删除线*/
public let DElETELIN={(deletelinText:String)->String in
    return "~~\(deletelinText)~~"
}
