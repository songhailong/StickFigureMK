//
//  JBMainViewController.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/12.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import CWLateralSlide
class JBMainViewController: JBBassViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title="简笔"
        let leftitem = UIBarButtonItem.init(image: UIImage.init(named: "头像"), style:UIBarButtonItemStyle.done, target: self, action:#selector (leftAction))
        self.navigationController?.navigationItem.leftBarButtonItem=leftitem
        setup()
    }
    
    func setup()  {
        weak var weakSelf=self
        cw_registerShowIntractive(withEdgeGesture: false) { (direction:CWDrawerTransitionDirection) in
            weakSelf?.defaultAnimationFromLeft()
        }
    }
    
    func defaultAnimationFromLeft()  {
        cw_showDefaultDrawerViewController(leftVC)
    }
  
    @objc func leftAction()  {
        defaultAnimationFromLeft()
    }
    lazy var leftVC:JBLeftViewController={
       let left=JBLeftViewController()
        return left
    }()
    
}
