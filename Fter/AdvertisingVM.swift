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
        
        init?(indata:AdverTisingPhoto) {
            
            guard let imageString =  indata.adPhotoName else { return nil }
            //킹피숴 대체해야함
            print(imageString)
            self.image = UIImage(named:imageString)!
        
            
        }
}

