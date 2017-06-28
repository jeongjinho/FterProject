//
//  MainTimeLineVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class MainTimeLineVC: UIViewController,UITabBarControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var advertisingCollectionView: UICollectionView!
    @IBOutlet weak var timeLineTableView: UITableView!
    @IBOutlet weak var menuSegment: DefaultSegment!
    
    var adDelegate: AdvertisingDelegate?
    var  photoData :[AdverTising?]?
    var isAutoScroll: Bool = true
    var idx : Int = 0
    override func viewWillAppear(_ animated: Bool) {
        
       
        self.advertisingCollectionView.register(UINib(nibName: "AdverTisingCell", bundle: nil), forCellWithReuseIdentifier: "AdverTisingCell")
         adDelegate = AdvertisingDelegate.init(sc:self, data:photoData! as! [AdverTising])
        self.advertisingCollectionView.dataSource = adDelegate
        self.advertisingCollectionView.delegate = adDelegate

       
        
        guard let  cnt = self.photoData?.count else { return  }
        
        print("before idx:" + "\(idx)")
        DispatchQueue.background(delay: 10.0, background: {
            self.advertisingCollectionView.scrollToItem(at:IndexPath(row:self.idx,section:0), at: .right, animated: true)        }, completion: {
                
                self.idx += 1
                if(self.idx >= cnt){
                    self.idx = 0
                 self.advertisingCollectionView.scrollToItem(at:IndexPath(row:self.idx,section:0), at:.right, animated: true)
                }
                self.viewWillAppear(false)
        })
       
    }
    
    var dummy: [TimeLine?]?
     var dealayInSeconds: Double = 2.0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.delegate = self;
        self.timeLineTableView.delegate = self;
        self.timeLineTableView.dataSource = self;
       // self.timeLineTableView.rowHeight = UITableViewAutomaticDimension;
        self.timeLineTableView.estimatedRowHeight = 400
         initialData()
        
        
       
    }

    
    
    
        
    
    

      
        
    func initialData()  {
        
       
        let one = TimeLine.init(sreplies:[Reply.init(sreply:"안녕하세요", sreplyerName:"서수진", sreplyTime:"2시간전", sreplyerImage: "dummyProfile2"),Reply.init(sreply:"안녕하세요 저는정진호입니다. 만나서반갑습니다 뭐하고지내세요??????", sreplyerName:"서초구불나방", sreplyTime:"3시간전", sreplyerImage: "dummyProfile2")], sreplyNumber:2, slikeNumber: 5, spostText:"개발은 끝이 없어요 그러니깐 그러니깐 맘비우고 편안히 하시면 어느새 완성되어 있을 겁니다.", swrittenDate:"19/02/34", swriterName:"이원진", swriterLevel:1, spostTitle: "니모를찾아서", swriterImage:"dummyProfile")
        
        let two = TimeLine.init(sreplies:[Reply.init(sreply:"안녕하세요 저는정진호입니다. 만나서반갑습니다 뭐하고지내세요????", sreplyerName:"홍주ㅇㄴㅇㄴㅇ영", sreplyTime:"2시간전", sreplyerImage: "dummyProfile2"),Reply.init(sreply:"누세요", sreplyerName:"박주영", sreplyTime:"3시간전", sreplyerImage: "dummyProfile")], sreplyNumber:2, slikeNumber: 5, spostText:"개발은 끝이 없어요 그러니깐 그러니깐 맘비우고 편안히 하시면 어느새 완성되어 있을 겁니다.", swrittenDate:"19/02/34", swriterName:"이원진", swriterLevel:1, spostTitle:"니모를찾아서", swriterImage:"dummyProfile")
    
        
        self.dummy = [one,two]
        
        self.photoData = [AdverTising.init(title:"개발자에게 필요한 툴 알아보기 제1탄!", photos:"1"),AdverTising.init(title:"개발자에게 필요한 툴 알아보기 제2탄!", photos:"2"),AdverTising.init(title:"개발자에게 필요한 툴 알아보기 제3탄!", photos:"3"),AdverTising.init(title:"개발자에게 필요한 툴 알아보기 제4탄!", photos:"4"),AdverTising.init(title:"개발자에게 필요한 툴 알아보기 제5탄!", photos:"5"),AdverTising.init(title:"개발자에게 필요한 툴 알아보기 제6탄!", photos:"6")]
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
    
    
    func autoScrolling()  {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + dealayInSeconds) {
            
            
        
        }
        
        guard let cnt = photoData?.count else { return  }
        for row in 0...2 {
            
            let idx = IndexPath(row: row, section: 0)
            self.advertisingCollectionView.scrollToItem(at:idx, at: .left, animated: true)
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let numberOfCells =  self.photoData?.count
        let page = Int(scrollView.contentOffset.x) / Int(scrollView.frame.size.width)
        
        print("page:" + "\(page)")
        
        if (page ==  (self.photoData?.count)! - 1){
            
            scrollView.contentOffset = CGPoint(x:0.0, y: 0.0)
            
        }
        // if you need to know changed position, you can delegate it
        //   customDelegate?.pageChanged(currentPage)
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
}
