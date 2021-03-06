//
//  ViewController.swift
//  TestMe
//
//  Created by admin on 3/15/22.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController , LoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
    }
    
    @IBOutlet weak var lgbtn: FBLoginButton!
    override func viewDidLoad() {
            super.viewDidLoad()
            if let token = AccessToken.current, !token.isExpired{
                let token = token.tokenString
                
                let req = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email,name"], tokenString: token, version: nil, httpMethod: .get)
                req.start{
                    conne, result, error in
                    print(result)
                }
            } else {
                //let loginbtn = FBLoginButton()
                //loginbtn.center = view.center
                //view.addSubview(loginbtn)
                self.lgbtn.delegate = self
                lgbtn.permissions = ["public_public", "email"]
            }
        }

        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            let token = result?.token?.tokenString
            
            let req = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email,name"], tokenString: token, version: nil, httpMethod: .get)
            req.start{
                conne, result, error in
                print(result)
            }
        }

    @IBAction func loginfb(_ sender: Any) {
    }
    
    
    @IBAction func userSettings(_ sender: Any) {
        let nextViewContoller = storyboard?.instantiateViewController(withIdentifier: "userMainPage") as! UIViewController
        self.present(nextViewContoller, animated: true, completion: nil)
    }
    
    
    @IBAction func adminSettings(_ sender: Any) {
        let nextViewContoller = storyboard?.instantiateViewController(withIdentifier: "userMainPage") as! UIViewController
        self.present(nextViewContoller, animated: true, completion: nil)
    }
    
    @IBAction func javaQuiz(_ sender: Any) {
        let nextViewContoller = storyboard?.instantiateViewController(withIdentifier: "quiz1") as! UIViewController
        self.present(nextViewContoller, animated: true, completion: nil)
    }
    
    
    @IBAction func swiftQuiz(_ sender: Any) {
        let nextViewContoller = storyboard?.instantiateViewController(withIdentifier: "quiz2") as! UIViewController
        self.present(nextViewContoller, animated: true, completion: nil)
    }
    
    
    @IBAction func tech3Quiz(_ sender: Any) {
    }
}

