//
//  JBLeftViewController.swift
//  StickFigureMK
//
//  Created by 靓萌服饰靓萌服饰 on 2018/10/12.
//  Copyright © 2018年 靓萌服饰靓萌服饰. All rights reserved.
//

import UIKit

class JBLeftViewController: JBBassViewController {
    var dataArr:NSMutableArray=NSMutableArray.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       }
 private  func setupUI(){
      self.view.addSubview(tableView)
    }
    
    lazy var tableView:UITableView={
        let tabview=UITableView.init(frame: self.view.frame, style: UITableViewStyle.plain)
        tabview.delegate=self
        tabview.dataSource=self
        return tabview
    }()
    
}
extension JBLeftViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell=tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell==nil {
            cell=UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
    cell?.accessoryType=UITableViewCellAccessoryType.disclosureIndicator
        }
        return cell!
    }
    
    
}
