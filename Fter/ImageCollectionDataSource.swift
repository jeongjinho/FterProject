//
//  ImageCollectionDataSource.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 28..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit


class ImageCollectionDelegate: NSObject {
    var lookPost: LookPostVC?
    var vc : MainTimeLineVC?
    var data = [UploadedImage?]()
    
    init(sc :MainTimeLineVC,data:[UploadedImage]) {
        self.vc = sc
        self.data = data
    }
    init(lookPostVC :LookPostVC,data:[UploadedImage]) {
        self.lookPost = lookPostVC
        self.data = data
    }
}

extension ImageCollectionDelegate: UICollectionViewDataSource{


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let uploadedCell = collectionView.dequeueReusableCell(withReuseIdentifier:"AdverTisingCell", for: indexPath) as! AdverTisingCell
        guard let imageData = self.data[indexPath.row] else { return uploadedCell }
        
        uploadedCell.configureUploaded(imageData)
        
        
        
        return uploadedCell
        
    }
}
