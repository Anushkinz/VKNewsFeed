//
//  AuthService.swift
//  VKNewsApp
//
//  Created by anushkinz on 4/3/22.


import Foundation
import VKSdkFramework

protocol AuthServiceDelegate: class {
    
    func authServiceSholdShow(_ viewController: UIViewController)
    
    func authServiceSignIn()
    
    func authServiceDidSignInFail()
}

final class AuthService: NSObject, VKSdkUIDelegate, VKSdkDelegate{
   
    private let appId = "8092233"

    private let vkSdk: VKSdk
    
    weak var delegate: AuthServiceDelegate?
    
    var token: String?{
        return VKSdk.accessToken()?.accessToken
    }
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKSdk.initialize")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    
    func wakeUpSession(){
        let scope = ["offline"]
        
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            if state == VKAuthorizationState.authorized{
                print("VKAuthorizationState.authorized")
                delegate?.authServiceSignIn()
            }else if state == VKAuthorizationState.initialized{
                print("VKAuthorizationState.initialized")
                VKSdk.authorize(scope)
            }else{
                print("auth problems, state \(state) error \(String(describing: error))")
                delegate?.authServiceDidSignInFail()
            }
        }
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSignIn()
        }
        delegate?.authServiceSignIn()
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceSholdShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
}



