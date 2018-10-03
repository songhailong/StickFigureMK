//
//  ViewController.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/9/28.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let with = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        
        let textview = SFTextView(frame: CGRect.init(x: 0, y: 64, width: with, height: height))
       self.view.addSubview(textview)
        
    }


}

