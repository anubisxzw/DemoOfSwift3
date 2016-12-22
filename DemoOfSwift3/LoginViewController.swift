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
    
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var counter: UILabel!
    
    var loginCount: Int = 0
    
    // 二重実行防止
    @IBAction func onClick(_ sender: Any) {
        
        let size = CGSize(width: 30, height:30)
        
        // キーボードクローズ
        keyboardClose()
        
        // count up
        loginCount = loginCount + 1
        counter.text = String(loginCount)
        
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
        
        // マスクキャンセル
        self.perform(#selector(delayedStopActivity), with: nil)
    }
    
    @IBAction func onClickNormal(_ sender: Any) {
        
        // キーボードクローズ
        keyboardClose()
        
        // count up
        loginCount = loginCount + 1
        counter.text = String(loginCount)
    }
    
    // マスクキャンセル
    func delayedStopActivity() {
        stopAnimating()
    }
    
    // キーボードクローズ
    @IBAction func tapViewAction(_ sender: UIControl) {
        keyboardClose()
    }

    func keyboardClose(){
        userId.resignFirstResponder()
        passWord.resignFirstResponder()
    }
}
