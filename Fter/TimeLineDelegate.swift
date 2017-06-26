//
//  TimeLineDelegate.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit
class TimeLineDataSource: NSObject {
    
    var vc : MainTimeLineVC
   // var data = [SchoolData?]()
    var selectedRow: Int?
    init(sc :MainTimeLineVC) {
        self.vc = sc
        //self.data = data
    }
}


extension TimeLineDataSource: UITableViewDataSource{


   
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
        
    }
    
    


}
