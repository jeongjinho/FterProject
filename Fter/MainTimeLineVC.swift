//
//  MainTimeLineVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class MainTimeLineVC: UIViewController,UITabBarControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    var adDelegate: AdvertisingDelegate?
    var  photoData :[AdverTisingPhoto?]?
    @IBOutlet weak var advertisingCollectionView: UICollectionView!
    @IBOutlet weak var timeLineTableView: UITableView!
@IBOutlet weak var menuSegment: DefaultSegment!
    var dummy: [TimeLine?]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.delegate = self;
        self.timeLineTableView.delegate = self;
        self.timeLineTableView.dataSource = self;
        
      initialData()
       adDelegate = AdvertisingDelegate.init(sc:self, data:photoData! as! [AdverTisingPhoto])
        
        self.advertisingCollectionView.register(UINib(nibName: "AdverTisingCell", bundle: nil), forCellWithReuseIdentifier: "AdverTisingCell")
        self.advertisingCollectionView.dataSource = adDelegate
       self.advertisingCollectionView.delegate = adDelegate
        
        
    }
    
    func initialData()  {
        
       
        let one = TimeLine.init(sreplies:[Reply.init(sreply:"안녕하세요", sreplyerName:"홍주영", sreplyTime:"2시간전", sreplyerImage: "dummyProfile2"),Reply.init(sreply:"누", sreplyerName:"박주영", sreplyTime:"3시간전", sreplyerImage: "dummyProfile2")], sreplyNumber:2, slikeNumber: 5, spostText:"dsdsdsdsdsdsd", swrittenDate:"19/02/34", swriterName:"이원진", swriterLevel:1, spostTitle: "니모를찾아서", swriterImage:"dummyProfile")
        
        let two = TimeLine.init(sreplies:[Reply.init(sreply:"안녕하세요", sreplyerName:"홍주영", sreplyTime:"2시간전", sreplyerImage: "dummyProfile2"),Reply.init(sreply:"누세요", sreplyerName:"박주영", sreplyTime:"3시간전", sreplyerImage: "dummyProfile")], sreplyNumber:2, slikeNumber: 5, spostText:"dsdsdsdsdsdsd", swrittenDate:"19/02/34", swriterName:"이원진", swriterLevel:1, spostTitle:"니모를찾아서", swriterImage:"dummyProfile")
    
        
        self.dummy = [one,two]
        
        self.photoData = [AdverTisingPhoto.init(photos:"1"),AdverTisingPhoto.init(photos:"2"),AdverTisingPhoto.init(photos:"3"),AdverTisingPhoto.init(photos:"4"),AdverTisingPhoto.init(photos:"5"),AdverTisingPhoto.init(photos:"6")]
    }
  
    //------------------------------
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return (dummy?.count)!
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let timeLineCell = Bundle.main.loadNibNamed("CustomTimeLineCell", owner: self, options:nil)?.first as! CustomTimeLineCell
        if let data = self.dummy?[indexPath.row] {
            
            timeLineCell.contfigure(data)
            
        }
        return timeLineCell
        
    }
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let index = viewController.tabBarItem.tag;
        
        if(index == 1 ){
            
           let stoy = UIStoryboard.init(name:"Main", bundle:nil)
             let vc  = stoy.instantiateViewController(withIdentifier:"PostingVCNavi")
            
           self.tabBarController?.present(vc, animated: true, completion: nil)
            return false;
            
        }
        
        return true;

        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func touchUpInsideMapButton(_ sender: UIButton) {
        
        let mapVC = self.storyboard?.instantiateViewController(withIdentifier:"MapVC") as! MapVC
        
        self.navigationController?.pushViewController(mapVC, animated:true)
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
    
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
