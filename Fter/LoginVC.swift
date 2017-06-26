//
//  LoginVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class LoginVC: UIViewController {

    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var kakaoButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        initialButton()
        initialNaViBar()
        // Do any additional setup after loading the view.
    }

    func initialButton() {
        self.kakaoButton.contentMode = .scaleAspectFill
        self.facebookButton.contentMode = .scaleAspectFill
    }
    
    func initialNaViBar()  {
        
        guard let naviBar = self.navigationController?.navigationBar else { return  }
    
        naviBar.shadowNabiBar()
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
    @IBAction func loginFacebook(_ sender: UIButton){
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: self) { (result, error) in
            if (error == nil) {
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                }
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    //everything works print the user data
                    print(result)
                
                    let profileVC =  self.storyboard?.instantiateViewController(withIdentifier:"ProfileVC") as! ProfileVC
                    
                    
                    self.navigationController?.pushViewController(profileVC, animated: true)
                    
                }
            })
            
        
        }
    }

}
