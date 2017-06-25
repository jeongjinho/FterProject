//
//  ProfileUI.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ProfileUI:UIButton {

    

}


@IBDesignable
class RightAlignedIconButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setImage(UIImage(named:"down"), for: UIControlState.normal)
        semanticContentAttribute = .forceRightToLeft
        contentHorizontalAlignment = .right
        let availableSpace = UIEdgeInsetsInsetRect(bounds, contentEdgeInsets)
        let availableWidth = availableSpace.width - imageEdgeInsets.left - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: availableWidth / 2)
        
    
    
    }
    func decrease()  {
        
        
    }
}

