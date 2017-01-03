//
//  LogInVC.swift
//  NihongoLearning
//
//  Created by Zack on 2016/12/27.
//  Copyright © 2016年 DaGin. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth

class LogInVC: UIViewController {

    @IBAction func FBLogInpressed(_ sender: Any) {
        let fbLogIn = FBSDKLoginManager()
        fbLogIn.logIn(withReadPermissions: ["email"], from: self, handler: {(result,error) in if error != nil{
            print("幹！臉書登入失敗啦 \(error)")
        }else if result?.isCancelled == true{
            print("使用者自己登出囉")
        }else{
            print("成功了啦！！！")
            let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            self.firebaseAuth(credential)
            }
        })
        
    }
    func firebaseAuth(_ credential: FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: {
            (user,error) in if error != nil{
                print("firebase授權不成功-\(error)")
            }else{
                print("firebase授權成功")
            }
            
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
