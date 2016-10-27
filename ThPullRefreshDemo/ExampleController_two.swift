//
//  ExampleController_two.swift
//  PullRefreshDemo
//
//  Created by ci123 on 16/1/19.
//  Copyright © 2016年 tanhui. All rights reserved.
//

import UIKit

class ExampleController_two: UIViewController {
    let tableView : UITableView = UITableView()
    lazy var dataArr : NSMutableArray = {
        return NSMutableArray()
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.frame = self.view.bounds
        self.tableView.addBounceHeadRefresh(self,bgColor:UIColor.orange,loadingColor:UIColor.lightGray, action: "loadNewData")
        self.tableView.addFootRefresh(self, action: "loadMoreData")

    }
    func loadNewData(){
        dataArr.removeAllObjects()
        for i in 0..<5{
            let str = "最新5个cell，第\(i+1)个"
            dataArr.add(str)
        }
        //延时模拟刷新
        DeLayTime(2.0, closure: { () -> () in
            self.tableView.reloadData()
            self.tableView.tableHeadStopRefreshing()
        })
        
    }
    func loadMoreData(){
        for i in 0..<5 {
            let str = "上拉刷新5个cell，第\(i+1)个"
            dataArr.add(str)
        }
        //延时模拟刷新
        DeLayTime(2.0, closure: { () -> () in
            self.tableView.reloadData()
            self.tableView.tableFootStopRefreshing()
        })
        
    }
}
