//
//  MainTimeLineVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class MainTimeLineVC: UIViewController {
    var currentIndex: Int = 0
    @IBOutlet weak var MenuSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
       MenuSegment.addUnderlineForSelectedSegment()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchUpInsideSeg(_ sender: UISegmentedControl) {
       MenuSegment.removeBorder()
       MenuSegment.changeUnderlinePosition()
       
        
        
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
