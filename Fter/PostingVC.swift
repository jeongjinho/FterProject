//
//  PostingVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class PostingVC: UIViewController{
    @IBOutlet weak var postingVieTopConstraint: NSLayoutConstraint!
    var categoryPickerView = UIPickerView()
    var partPickerVeiw = UIPickerView()
      var textfieldDelegate: PostingTextFieldDelegate?
    var partFieldDelegate: PostingTextFieldDelegate?
    var part = ["경영/마케팅","개발","디자인"]
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
       

        textfieldDelegate = PostingTextFieldDelegate(self)
        partFieldDelegate = PostingTextFieldDelegate(self)
         self.partTextField.delegate = textfieldDelegate
        self.categoryTextField.delegate = partFieldDelegate
        
        // Do any additional setup after loading the view.
        self.initialNaiBar()
        
       // menuPickerView.delegate = self
      //  menuPickerView.dataSource = self
       
    }

    
    
    
    func initialPicker() {
        
       
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        print("올라온다")
        
    }
    
    
    
    @IBAction func touchUpInsideBackButton(_ sender: Any) {
        self.dismiss(animated:true, completion:nil)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func initialNaiBar()  {
        
        guard let naviBar = self.navigationController?.navigationBar else { return  }
        
        naviBar.shadowNabiBar()
      //  self.navigationController?.setNavigationBarHidden(false, animated:false)
    }

}
