//
//  ReplyWindow.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 29..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit

class ReplyWindow: UIView{

    
    @IBOutlet weak var inputTextView: UITextField!
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ReplyWindow", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
  
    @IBAction func touchUpInsideVariableButton(_ sender: Any) {
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print("리턴버튼눌림")
        return true
    }
    func setDelegate(vc:LookPostVC)  {
        
        self.inputTextView.delegate = vc
    }

    

}
