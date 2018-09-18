//
//  testTableView.swift
//  demo
//
//  Created by Baird-weng on 2018/9/18.
//  Copyright © 2018年 9377. All rights reserved.
//

import UIKit

class testTableView: UITableView,UIGestureRecognizerDelegate {
    
    var isyd:Bool = false;
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.panGestureRecognizer.delegate = self;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if(self.contentOffset.y == -20&&otherGestureRecognizer is UIPanGestureRecognizer){
            return true;
        }
        return false
    }

}
