//
//  CategoryTableViewDataSource.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 30..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit
class CategoryDelegateModel: NSObject {
    
    var vc: CategoryVC?
    var data: [String]?
    
    init(vc: CategoryVC, data:[String]) {
    
        self.vc = vc
        self.data = data
    }
    
}

extension CategoryDelegateModel:UITableViewDelegate,UITableViewDataSource{




    func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let cnt = self.data?.count else  { return 0 }
        return cnt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = tableView.dequeueReusableCell(withIdentifier:"CategoryCell", for: indexPath) as! CategoryCell
        
        guard let data = self.data else { return UITableViewCell() }
        
        categoryCell.categoryTitleLabel.text = data[indexPath.row]
        
        return categoryCell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (vc?.categoryTableView.frame.size.height)! / 4
    }
}
