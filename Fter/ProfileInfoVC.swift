//
//  ProfileInfoVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 30..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ProfileInfoVC: UIViewController {

    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var InfoView: UIView!
    var ree: CGRect?
    var profileCallbck: ProfileCallBack?
    var isCancel: Bool = false
    
    func  getProfileInfoDelegate(callback: ProfileCallBack) {
        
            profileCallbck = callback
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initialButton()
        self.InfoView.layer.cornerRadius = 20
        ree = InfoView.frame
    
        InfoView.alpha = 0
        InfoView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        
        UIView.animate(withDuration: 0.15) {
            
            self.InfoView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.InfoView.alpha = 1
        }
        
    }

    func initialButton()  {
        let cancelBtnVM = ButtonViewModel.init(fontColor:AppColors.GrayColor2, text: "안녕", borderColor: AppColors.GrayColor, borderWidth: 1, borderRadius:Float(cancelButton.frame.height/2), backgroundColor: .white)
        
        cancelButton.DefaultButton(style:.borderStyle, buttonVM: cancelBtnVM)
        
         let followBtnVM = ButtonViewModel.init(fontColor:AppColors.PupleColor, text: "안녕", borderColor: AppColors.PupleColor, borderWidth: 5, borderRadius:Float(cancelButton.frame.height/2), backgroundColor: .white)
        
        followButton.DefaultButton(style: .fillStyle, buttonVM: followBtnVM)
        
        
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
    @IBAction func touchUpInsideCancelButton(_ sender: UIButton) {
        
        isCancel = true
        InfoView.alpha = 1
   
       // InfoView.frame = ree!
        InfoView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
       
        
        UIView.animate(withDuration: 0.15, animations: {
            
            self.InfoView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            self.InfoView.alpha = 0
            self.profileCallbck?.cancel(isCancel:self.isCancel)
        }) { (iscoplete) in
            
         
        }
        

       
    }

    
}
