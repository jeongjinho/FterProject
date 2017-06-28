//
//  AdverTisingCell.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class AdverTisingCell: UICollectionViewCell {

    @IBOutlet weak var advertisingTitle: UILabel!
    @IBOutlet weak var advertisingImageView: UIImageView!
  
        var data: AdverTising?

    
    func configure(_ model:AdverTising) {
      
        self.data = model
        configurePhotoImage()
        confiugureAdTitle()
    }
    
    func configurePhotoImage(){
    
    
        let vm = AdImageViewModel.init(indata:data!)
    
        self.advertisingImageView.configureAdPhotosImage(vm!)
        
    }
    
    func confiugureAdTitle() {
        
     let vm = AdTitleViewModel.init(indata: data!)
        
        self.advertisingTitle.adTitleLabelConfiugure(vm!)
    }


}
