//
//  MainTimeLineVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class MainTimeLineVC: UIViewController {
   
    @IBOutlet weak var timeLineTableView: UITableView!
    @IBOutlet weak var pagingCollectionView: UICollectionView!
@IBOutlet weak var menuSegment: DefaultSegment!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        
        
    }

  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func touchUpInsideFeedButton(_ sender: UIButton) {
      
       // var subBtn :UIButton
        for subView in menuSegment.subviews {
            
            if(subView .isKind(of:UIButton.self) == true){
            
                let btn = subView as! UIButton
                 btn.isSelected = false
                 btn.underLineView(isSelect: false)
                if(sender.tag == btn.tag){
                    if(sender.isSelected != true){
                        
                        btn.underLineView(isSelect:true)
                    }
                    
                }
            }
            
            
           
           
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchUpInsideSeg(_ sender: UISegmentedControl) {
     //  MenuSegment.removeBorder()
    //   MenuSegment.changeUnderlinePosition()
       
        
        
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
