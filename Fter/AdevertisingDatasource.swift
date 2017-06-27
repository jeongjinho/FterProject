//
//  AdevertisingDelegate.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit

class AdvertisingDelegate: NSObject {
    
    var vc : MainTimeLineVC
    var data = [AdverTisingPhoto?]()
    var selectedRow: Int?
    init(sc :MainTimeLineVC,data:[AdverTisingPhoto]) {
        self.vc = sc
       self.data = data
    }
}

extension AdvertisingDelegate: UICollectionViewDelegate,UICollectionViewDataSource{

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.data.count
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let adCell = Bundle.main.loadNibNamed("AdverTisingCell", owner:self, options:nil)?.first as! AdverTisingCell
        
        if  let data = self.data[indexPath.row]{
        
            adCell.configure(data)
        
        }
        return adCell
    }
    
    
    

}
