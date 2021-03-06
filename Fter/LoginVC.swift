//
//  LoginVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class LoginVC: UIViewController,NetworkingCallBack {
    var loginFlag: String?
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var kakaoButton: UIButton!
    var id: String?
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
        
          FBLoginNetwork(vc: self).callFaceBook { (data) -> Void in
            print(data)
            LoginNetworkModel(self).getUserLoginInfo(id: data)
            
        }
        
    }
        func networkFailed() {
        
        
        
    }
    
    func networkResult(resultData: Any, code: String) {
        loginFlag = resultData as! String
        if(loginFlag == "new"){
            UserDefaults.standard.setValue(self.id, forKey:"ID")
        let profileVC = self.storyboard?.instantiateViewController(withIdentifier:"ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(profileVC, animated: true)
        
        } else if(loginFlag == "old"){
              UserDefaults.standard.setValue(self.id, forKey:"ID")
            let timeLineVC = self.storyboard?.instantiateViewController(withIdentifier:"MainTimeLineVC") as! MainTimeLineVC
            self.present(timeLineVC.navigationController!, animated: true, completion: nil)
        
        }
        
    }
}
