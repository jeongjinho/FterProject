//
//  PagingCollectionVM.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation

import UIKit
class PagingViewDataSource: NSObject {
    
    var vc : MainTimeLineVC
    // var data = [SchoolData?]()
    var selectedRow: Int?
    init(sc :MainTimeLineVC) {
        self.vc = sc
        //self.data = data
    }
}

extension PagingViewDataSource: UICollectionViewDataSource{


    

}
