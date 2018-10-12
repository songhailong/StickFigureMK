//
//  JBBassViewController.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/12.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class JBBassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     self.navigationController?.navigationBar.backgroundColor=JBRGBColor.JBMainColor()
        self.navigationController?.title="简笔"
        let leftitem = UIBarButtonItem.init(image: UIImage.init(named: "返回"), style:UIBarButtonItemStyle.done, target: self, action:#selector (leftbassAction))
    self.navigationController?.navigationItem.leftBarButtonItem=leftitem
        self.view.backgroundColor=UIColor.white
    }
  @objc  func leftbassAction()  {
        
    }
}
