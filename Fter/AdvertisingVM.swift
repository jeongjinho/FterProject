//
//  AdvertisingVM.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit


    
    
  
struct AdImageViewModel:ImageForCellProtocol {
        
        var image: UIImage
        //var radious: CGFloat
        
        init?(indata:AdverTising) {
            
            guard let imageString =  indata.adPhotoName else { return nil }
            //킹피숴 대체해야함
            print(imageString)
            self.image = UIImage(named:imageString)!
        
            
        }
}
struct UploadImageViewModel:ImageForCellProtocol {
    
    var image: UIImage
    //var radious: CGFloat
    
    init?(indata:UploadedImage) {
        
        guard let imageString =  indata.uploaded else { return nil }
        //킹피숴 대체해야함
        print(imageString)
        self.image = UIImage(named:imageString)!
        
        
    }
}



struct AdTitleViewModel:TextForCellProtocol {
    var title: String
    var textFontStyle: UIFont
    var textColor: UIColor
    init?(indata:AdverTising) {
        
        guard let titleString =  indata.adTitle else { return nil }
        self.title = "\(titleString)"
        self.textFontStyle = UIFont(name:"HelveticaNeue-Bold", size: 18.0)!
        self.textColor = .white
    }
}
