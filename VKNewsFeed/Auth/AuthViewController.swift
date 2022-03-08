//
//  AuthViewController.swift
//  VKNewsApp
//
//  Created by anushkinz on 5/3/22.
//

import UIKit

class AuthViewController: UIViewController {
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
//        authService = AuthServices()
        // Do any additional setup after loading the view.
        authService = AppDelegate.shared().authService
    }
    
    
  
    @IBAction func signInTouch() {
        authService.wakeUpSession()
    }
 
}
