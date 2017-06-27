//
//  PostingVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class PostingVC: UIViewController {
    var menuPickerView = UIPickerView()
    var part = ["경영/마케팅","개발","디자인"]
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initialNaiBar()
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
