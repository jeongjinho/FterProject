//
//  AdverTisingCell.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class AdverTisingCell: UICollectionViewCell {

    @IBOutlet weak var advertisingImageView: UIImageView!
  
        var photos: AdverTisingPhoto?

    
    func configure(_ model:AdverTisingPhoto) {
      
        self.photos = model
        configurePhotoImage()
    }
    
    func configurePhotoImage(){
    
    
        let vm = AdImageViewModel.init(indata:photos!)
    
        self.advertisingImageView.configureAdPhotosImage(vm!)
        
    }


}
