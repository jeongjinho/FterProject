//
//  AllReplyVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 29..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class AllReplyVC: UIViewController {

    @IBOutlet weak var replyWindow: UIView!
    @IBOutlet weak var replesTableView: UITableView!
    @IBOutlet weak var menuSegment: DefaultSegment!
    //@IBOutlet weak var menuSegment: DefaultSegment!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.barTintColor = UIColor.white
        self.tabBarController?.tabBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.pureNabiBar()
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.tabBarController?.tabBar.isTranslucent = false
        // Do any additional setup after loading the view.
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
    
//    @IBAction func touchUpInsideBackButton(_ sender: Any) {
//    }
//    @IBAction func touchUpInsideFeedButton(_ sender: UIButton) {
//        
//        // var subBtn :UIButton
//        for subView in menuSegment.subviews {
//            
//            if(subView .isKind(of:UIButton.self) == true){
//                
//                let btn = subView as! UIButton
//                btn.isSelected = false
//                btn.underLineView(isSelect: false)
//                if(sender.tag == btn.tag){
//                    if(sender.isSelected != true){
//                        
//                        btn.underLineView(isSelect:true)
//                    }
//                    
//                }
//            }
//            
//        }
//        
//    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


