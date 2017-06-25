//
//  TextFieldAtt.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class UnderlineTextField: UITextField {


    override func draw(_ rect: CGRect) {
    
        let layer = CALayer()
        layer.frame = CGRect(x: 0.0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1.0)

       layer.backgroundColor = UIColor.gray.cgColor
        
        self.layer.addSublayer(layer)
    }
    
    
    
    

}



extension UITextField
{
    enum Direction
    {
        case Left
        case Right
    }
    
    func AddImage(direction:Direction,imageName:String,backgroundColor:UIColor)
    {
        
        let fm = CGRect(x:0, y:0, width:60, height:self.frame.size.height)
        
        let View = UIView(frame: fm)
        View.backgroundColor = backgroundColor
        
        let imageView = UIImageView(frame: fm)
        imageView.image = UIImage(named: imageName)
        
        View.addSubview(imageView)
        
        if Direction.Left == direction
        {
            self.leftViewMode = .always
            self.leftView = View
        }
        else
        {
            self.rightViewMode = .always
            self.rightView = View
        }
    }
    
}
