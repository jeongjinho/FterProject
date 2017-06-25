//
//  CustomSegment.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class DefaultSegment: UIButton {
    
    
    func UnderLineView() {
        
        let layer = CALayer()
        layer.frame = CGRect(x: 0.0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1.0)
        
        layer.backgroundColor = AppColors.PupleColor.cgColor
        
        self.layer.addSublayer(layer)
    }
    
    func removeBoarder() {
        
        
        self.removeFromSuperview()
        
    }
    
    

}
