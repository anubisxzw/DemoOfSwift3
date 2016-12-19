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

class LoginViewController: UIViewController, NVActivityIndicatorViewable {
    
    // 二重実行防止
    @IBAction func onClick(_ sender: Any) {
        
        let size = CGSize(width: 30, height:30)
        
        // マスクかけ
        startAnimating(size, message: "Loading...", type: NVActivityIndicatorType.ballSpinFadeLoader)
        
        // 遅延キャンセル
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(doOnClick), object: nil)
        // 遅延対応
        /*
         1.5秒待ち、doOnClickを呼び出す
         */
        self.perform(#selector(doOnClick), with: nil, afterDelay: 1.5)
    }
    
    @objc private func doOnClick() {
        
        // 詳細表示へ
        self.performSegue(withIdentifier: "ShowDetail", sender: nil)
        
        // マスクキャンセル
        self.perform(#selector(delayedStopActivity), with: nil)
    }
    
    // マスクキャンセル
    func delayedStopActivity() {
        stopAnimating()
    }
}
