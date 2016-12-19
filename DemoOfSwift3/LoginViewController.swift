//
//  LoginViewController.swift
//  DemoOfSwift3
//
//  Created by 许之午 on 2016/12/19.
//  Copyright © 2016年 许之午. All rights reserved.
//

import UIKit
import Foundation
import NVActivityIndicatorView

class LoginViewController: UIViewController {
    
    // 二重実行防止
    @IBAction func onClick(_ sender: Any) {
        
        print(NSDate.timeIntervalSinceReferenceDate)
        
        // 遅延キャンセル
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(doOnClick), object: nil)
        // 遅延対応
        /*
         1.5秒待ち、doOnClickを呼び出す
         */
        self.perform(#selector(doOnClick), with: nil, afterDelay: 1.5)
    }
    
    @objc private func doOnClick() {
        
        print(NSDate.timeIntervalSinceReferenceDate)
        // 詳細表示へ
        self.performSegue(withIdentifier: "ShowDetail", sender: nil)
    }
    
}
