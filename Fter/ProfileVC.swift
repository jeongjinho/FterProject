//
//  ProfileVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 24..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController{

     var parMenuPickerView = UIPickerView()
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var partButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.menuArray ={"경영/마케팅"}
        initialNaViBar()
        initialButton()
        
      //~~~~~~~~~~
        let leftImageView = UIImageView()
        leftImageView.image = UIImage(named: "down")
        
        let leftView = UIView()
        leftView.addSubview(leftImageView)
        
        leftView.frame = CGRect(x: partTextField.frame.size.width-40, y: 0, width: 40, height: 40)
        leftImageView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        partTextField.rightViewMode = .always
        partTextField.rightView = leftView
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~
    }
    
    func initialButton() {
        let btnVM = ButtonViewModel.init(fontColor: UIColor.orange, text: "안녕", borderColor: UIColor.brown, borderWidth: 3, borderRadius:Float(completeButton.frame.height/2), backgroundColor: .white)
        
        self.completeButton.configureButton(style:.fillStyle, buttonVM: btnVM)
    }
    
    func initialNaViBar()  {
        guard let naviBar = self.navigationController?.navigationBar else { return  }
        
        naviBar.shadowNabiBar()
    }

    
     

}
