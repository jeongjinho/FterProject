//
//  CategoryVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 29..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var adImageView: UIView!
    
    var categoryData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
         self.tabBarController?.tabBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowNabiBar()
         inititialCategoryData()
        let categoryDelegate = CategoryDelegateModel.init(vc:self, data:categoryData)
        
     categoryTableView.delegate = self
     categoryTableView.dataSource = self
 
        
       
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    
        return categoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = tableView.dequeueReusableCell(withIdentifier:"CategoryCell", for: indexPath) as! CategoryCell
        
       
        
        categoryCell.categoryTitleLabel.text = categoryData[indexPath.row]
        
        return categoryCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.categoryTableView.frame.size.height / 4
    }
    func inititialCategoryData() {
        categoryData = ["# 고민이에요","# 궁금해요","# 일상이야기","# 함께해요"]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
