//
//  SFTextInputView.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/9/28.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import Masonry
enum InputMessgeType:Int {
    case image//图片
    case Link//链接
    case title//标题
    case list //无序列表
    case text//内容
    case h1
    case h2
    case h3
    case h4
    case Code //代码块
    case Bold //加错
    case  pluhSign //加号
    case Color
    case Divider //分割线
    case Italics //斜体
}
 protocol SFTextInputViewDlegate {
    
  func TextInputViewDidSelect(TextInputView:SFTextInputView,textTitle:InputMessgeType)
}
@objcMembers
class SFTextInputView: UIView {
    
    //var scrollView :UIScrollView!
    
   var delegate:SFTextInputViewDlegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //初始化
  private  func setupUI(){
//       scrollView=UIScrollView()
      scrollView.frame=self.bounds
   // print("---------------------\(self.frame)")
      scrollView.delegate=self;
     //self.addSubview(scrollView)
//   // scrollView.frame=CGRect.init(x: 0, y: 0, width: self.frame.size, height: <#T##CGFloat#>)
    scrollView.backgroundColor=UIColor.green
//    scrollView.mas_makeConstraints { (mask:MASConstraintMaker!) in
//        mask.top.mas_equalTo()(0)
//        mask.bottom.mas_equalTo()(0)
//        mask.left.mas_equalTo()(0)
//        mask.right.mas_equalTo()(0)
//    }
    
    
    
    //let  btnImages:NSArray=["加号","标题1","标题2","加粗","代码块","无序标题","链接","加号","标题1","标题2","加粗","代码块","无序标题"]
    
   //let textTitle:NSArray=["bolds","italic","code","List","Link","Image","Undo","","","","","","","","",]
    
    //scrollView.contentSize=CGSize.init(width: 40*btnImages.count, height: 40)
    scrollView.indicatorStyle=UIScrollViewIndicatorStyle.white
    scrollView.showsVerticalScrollIndicator=false
//    for i in 0..<btnImages.count {
//        let btn:UIButton=UIButton()
//        scrollView.addSubview(btn)
//        //btn.setTitle(btnImages[i] as? String, for: UIControlState.normal)
//        btn.setImage(UIImage.init(named: btnImages[i] as! String), for: UIControlState.normal)
//        //swift4.0 方法的添加
//        btn.addTarget(self, action:#selector(inputBtnAction(_:)), for: UIControlEvents.touchUpInside)
//       let with = 40*i
//        btn.mas_makeConstraints { (mask:  MASConstraintMaker!) in
//            mask.top.mas_equalTo()(0)
//            mask.bottom.mas_equalTo()(0)
//            mask.left.mas_equalTo()(with)
//            mask.width.mas_equalTo()(40)
//        }
 //       }
    
    
    }
    
    lazy var scrollView:UIScrollView = {
        let screview = UIScrollView()
        
        
        
        return screview
        
    }()
    
    

   override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(scrollView)

    scrollView.mas_makeConstraints { (mask:MASConstraintMaker!) in
        mask.top.mas_equalTo()(0)
        mask.bottom.mas_equalTo()(0)
        mask.left.mas_equalTo()(0)
        mask.right.mas_equalTo()(0)
    }
     let  btnImages:NSArray=["加号","标题1","标题2","加粗","代码块","无序列表","链接","加号","标题1","标题2","加粗","代码块","无序标题"]
    for i in 0..<btnImages.count {
        let btn:UIButton=UIButton()
        btn.tag=i
        scrollView.addSubview(btn)
        //btn.setTitle(btnImages[i] as? String, for: UIControlState.normal)
        btn.setImage(UIImage.init(named: btnImages[i] as! String), for: UIControlState.normal)
        //swift4.0 方法的添加
        btn.addTarget(self, action:#selector(inputBtnAction(_:)), for: UIControlEvents.touchUpInside)
        let with = 40*i
        btn.frame=CGRect.init(x: with, y: 0, width: 40, height: 40)
       // print(self.frame)
        
//        btn.mas_makeConstraints { (mask:  MASConstraintMaker!) in
//            mask.top.mas_equalTo()(0)
//            mask.bottom.mas_equalTo()(0)
//            mask.left.mas_equalTo()(with)
//            mask.width.mas_equalTo()(40)
//        }
    
    }
    scrollView.contentSize=CGSize.init(width: 40*btnImages.count, height: 40)
    
    
    
    }
    
}
/**代理*/
extension SFTextInputView:UIScrollViewDelegate {
    
    
    
    
    
    
    
    
    
}

extension SFTextInputView{
    @objc func inputBtnAction(_ sender:UIButton){
        //执行代理
        
      print("按钮点击")
        var MessgeType=InputMessgeType.pluhSign
        
        switch sender.tag {
        case 0:
            MessgeType=InputMessgeType.pluhSign
            
        break;
        case 1:
            MessgeType=InputMessgeType.h1
        case 2:
            MessgeType=InputMessgeType.h2
        case 3:MessgeType=InputMessgeType.Bold
        case 4:MessgeType=InputMessgeType.Code
        case 5:MessgeType=InputMessgeType.list
        case 6:MessgeType=InputMessgeType.Link
        case 7:MessgeType=InputMessgeType.Code
        default: break
            
        }
        
        delegate?.TextInputViewDidSelect(TextInputView: self, textTitle:MessgeType )
        
    }
    
}
