//
//  SimpleLayoutViewController.swift
//  SnapKit
//
//  Created by Spiros Gerokostas on 01/03/16.
//  Copyright © 2016 SnapKit Team. All rights reserved.
//

import UIKit

class SimpleLayoutViewController: UIViewController {

    var didSetupConstraints = false
    
    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .blackColor()
        return view
    }()
    
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .redColor()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(blackView)
        view.addSubview(redView)
        
        view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        
        if (!didSetupConstraints) {
            
            blackView.snp_makeConstraints(closure: { (make) -> Void in
                make.center.equalTo(view)
                make.size.equalTo(CGSizeMake(100.0, 100.0))
            })
            
            redView.snp_makeConstraints(closure: { (make) -> Void in
                make.top.equalTo(blackView.snp_bottom).offset(20.0)
                make.size.equalTo(CGSizeMake(100.0, 100.0))
            })
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }

}
