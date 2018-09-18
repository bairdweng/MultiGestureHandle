//
//  ViewController.swift
//  demo
//
//  Created by Baird-weng on 2018/9/18.
//  Copyright © 2018年 9377. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView:testTableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "12312312312312"
        return cell;
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = testTableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .plain)
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView.delegate = self;
        self.tableView.delaysContentTouches = true;
        self.tableView.dataSource = self;
        self.tableView.bounces = false;
        tableView.backgroundColor = .red;
        self.view.addSubview(self.tableView);
        let swipe =  UIPanGestureRecognizer(target: self, action: #selector(swipe(ret:)));
        self.view.addGestureRecognizer(swipe)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func swipe(ret:UIPanGestureRecognizer){
        //判断手势方向。
        let point =  ret.translation(in: self.view);
        if(ret.state == .changed){
            if(point.y>0){
                self.tableView.frame = CGRect(x: 0, y: point.y, width: self.tableView.frame.size.width, height: self.tableView.frame.size.height);
            }
        }
        else if(ret.state == .ended){
            if(point.y<100){
                UIView.animate(withDuration: 0.2) {
                    self.tableView.frame = self.view.bounds;
                }
            }
            else{
              
                UIView.animate(withDuration: 2, animations: {
                    var rc = self.tableView.frame;
                    rc.origin.y = self.view.frame.size.height;
                    self.tableView.frame = rc;

                }) { (finis) in
                    UIView.animate(withDuration: 0.2, animations: {
                        self.tableView.frame = self.view.bounds;

                    })
                }
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

