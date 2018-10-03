//
//  SFTextView.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/9/28.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit
import EFMarkdown
import JavaScriptCore
import Masonry
/**MarkDown语法汇总
   
 
 */
class SFTextView: UIView {
    var textView:UITextView?
   // var inputBar :UITabBar?
    var jsContext:JSContext!
    var markSrt:String?
    
    //override 重写父类
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChange), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //初始化UI
    func setupUI()  {
        self.textView=UITextView()
        textView?.delegate=self
        textView?.backgroundColor=UIColor.red
       textView?.keyboardDismissMode=UIScrollViewKeyboardDismissMode.onDrag
        self.addSubview((self.textView ?? nil)!)
        textView?.inputAccessoryView=inputbar
        //textView?.becomeFirstResponder()
        textView?.frame=CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: 500)
        
        
//        textView?.mas_makeConstraints({ (mask:MASConstraintMaker!) in
//            mask.left.mas_equalTo()(0)
//            mask.right.mas_equalTo()(0)
//            mask.top.mas_equalTo()(0)
//            mask.bottom.mas_equalTo()(100)
//            print("就损数据库比较快崩溃绝对不是")
//        })
    }
    //懒加载
    private lazy var inputbar:UIView={
        let view = SFTextInputView()
        view.frame.size=CGSize.init(width: 40, height: 40)
        view.delegate=self
        return view
    }()
 @objc   func keyboardChange(notify:NSNotification) {
       print("键盘发生改变")
    }
    
}
//代理方法实现
extension SFTextView:UITextViewDelegate,SFTextInputViewDlegate{
    
    func TextInputViewDidSelect(TextInputView: SFTextInputView, textTitle: InputMessgeType) {
        var insetText:String?
        var selelctRang = self.textView?.selectedRange
     
        print("f代理执行\(textTitle)")
        switch textTitle {
        case .Bold:
            print("粗体")
            break
        case .h1:
            insetText="#"
            print("标题1")
        case .h2:  break
        case .Link:
            
            break
        case .list: break
        case .pluhSign:break
        default:
            break
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        return true
    }
    //内容发生改变
    func textViewDidChange(_ textView: UITextView) {
        
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    
    
}

