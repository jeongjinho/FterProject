//
//  TimeLineExteion.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit


extension UILabel{
    func configurePostTextView(_ viewModel: TextForCellProtocol) {
        
        self.text = viewModel.title
        print("\(self.text)")
        self.textColor = viewModel.textColor
        self.numberOfLines = 3
        self.lineBreakMode = .byWordWrapping
    }
    
    
    
}



extension UILabel{
   
    
    func configureTimeLineLabel(_ viewModel: TextForCellProtocol) {
        print(viewModel.title)
        self.text = viewModel.title
        
        self.textColor = viewModel.textColor
        
    }
    
}
extension UIButton{
   
    
    func configureTimeLineButton(_ viewModel: TextForCellProtocol) {
        
        self.titleLabel?.text = viewModel.title
        // print("\(self.text)")
        self.setTitleColor(viewModel.textColor, for: .normal)
        
    }
    func configureTimeLineButtonImage(_ viewModel: ImageForCellProtocol) {
        
            self.setBackgroundImage(viewModel.image, for: .normal)
            self.layer.cornerRadius = viewModel.radious
            
        // print("\(self.text)")
      
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.fill
        self.contentVerticalAlignment = UIControlContentVerticalAlignment.fill;
    }
   
    
}

extension UIImageView{
    
    func configureTimeLineImage(_ viewModel: ImageForCellProtocol){
        
        self.image = viewModel.image
        self.layer.cornerRadius = viewModel.radious
    }
    
    func configureReplyImage(_ viewModel: ImageForCellProtocol){
        
        self.image = viewModel.image
        self.layer.cornerRadius = viewModel.radious
    }
    
    func configureAdPhotosImage(_ viewModel: ImageForCellProtocol){
        
        self.image = viewModel.image
        //self.layer.cornerRadius = viewModel.radious
    }
    
}
