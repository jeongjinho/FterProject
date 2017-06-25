//
//  NavigationAtt.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

extension UINavigationBar {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
        
               // Drawing code
    func shadowNabiBar() {
    
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false

    }
    
   
}
