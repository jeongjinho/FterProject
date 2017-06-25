//
//  LoginVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialButton()
        initialNaViBar()
        // Do any additional setup after loading the view.
    }

    func initialButton() {
        
        let btnVM = ButtonViewModel.init(fontColor: UIColor.orange, text: "안녕", borderColor: UIColor.brown, borderWidth: 3, borderRadius:Float(loginButton.frame.height/2), backgroundColor: .white)
        
        self.loginButton.configureButton(style:.fillStyle, buttonVM: btnVM)

    
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

}
