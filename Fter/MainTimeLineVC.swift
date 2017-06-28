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
    @IBOutlet weak var adPagingControl: UIPageControl!
    var dummy: [TimeLine?]?
    var uploadImages: [UploadedImage?]?
    var adDelegate: AdvertisingDelegate?
    var  photoData :[AdverTising?]?
    var isAutoScroll: Bool = true
    var idx : Int = 0
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
       self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.advertisingCollectionView.register(UINib(nibName: "AdverTisingCell", bundle: nil), forCellWithReuseIdentifier: "AdverTisingCell")
         adDelegate = AdvertisingDelegate.init(sc:self, data:photoData! as! [AdverTising])
        self.advertisingCollectionView.dataSource = adDelegate
        self.advertisingCollectionView.delegate = adDelegate
        self.adPagingControl.numberOfPages = (self.photoData?.count)!
       
        
//        guard let  cnt = self.photoData?.count else { return  }
//        
//        if(isAutoScroll){
//            print("before idx:" + "\(idx)")
//            DispatchQueue.background(delay: 5.0, background: {
//                self.advertisingCollectionView.scrollToItem(at:IndexPath(row:self.idx,section:0), at: .right, animated: true)
//            }, completion: {
//                    
//                    self.idx += 1
//                    self.adPagingControl.currentPage = self.idx
//                    
//                    if(self.idx >= cnt){
//                        self.idx = 0
//                        self.adPagingControl.currentPage = self.idx
//                        self.advertisingCollectionView.scrollToItem(at:IndexPath(row:self.idx,section:0), at:.right, animated: true)
//                    }
//                    self.viewWillAppear(false)
//            })
//
//        
//        }
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.isAutoScroll = false
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self;
        self.timeLineTableView.delegate = self;
        self.timeLineTableView.dataSource = self;
       // self.timeLineTableView.rowHeight = UITableViewAutomaticDimension;
        self.timeLineTableView.estimatedRowHeight = 400
         initialData()
        
        
       
    }

    //scroll
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let numberOfCells = self.photoData?.count
        idx = Int(scrollView.contentOffset.x) / Int(scrollView.frame.size.width)
        
        print("page:" + "\(idx)")
        
        if (idx == (self.photoData?.count)!-1){
            
            scrollView.contentOffset = CGPoint(x:0.0, y: 0.0)
            self.adPagingControl.currentPage = 0
        }
        self.adPagingControl.currentPage = idx
    }

    
        
    
    

      
        
    func initialData()  {
        
       
        let one = TimeLine.init(sreplies:[Reply.init(sreply:"안녕하세요", sreplyerName:"서수진", sreplyTime:"2시간전", sreplyerImage: "dummyProfile2"),Reply.init(sreply:"안녕하세요 저는정진호입니다. 만나서반갑습니다 뭐하고지내세요??????", sreplyerName:"서초구불나방", sreplyTime:"3시간전", sreplyerImage: "dummyProfile2")], sreplyNumber:2, slikeNumber: 5, spostText:"개발은 끝이 없어요 그러니깐 그러니깐 맘비우고 편안히 하시면 어느새 완성되어 있을 겁니다.", swrittenDate:"19/02/34", swriterName:"이원진", swriterLevel:1, spostTitle: "니모를찾아서", swriterImage:"dummyProfile", suploadedImage:  [UploadedImage.init(imageName:"1"),UploadedImage.init(imageName:"2"),UploadedImage.init(imageName:"3"),UploadedImage.init(imageName:"4"),UploadedImage.init(imageName:"5")])
        
        let two = TimeLine.init(sreplies:[Reply.init(sreply:"안녕하세요 저는정진호입니다. 만나서반갑습니다 뭐하고지내세요????", sreplyerName:"홍주ㅇㄴㅇㄴㅇ영", sreplyTime:"2시간전", sreplyerImage: "dummyProfile2"),Reply.init(sreply:"누세요", sreplyerName:"박주영", sreplyTime:"3시간전", sreplyerImage: "dummyProfile")], sreplyNumber:2, slikeNumber: 5, spostText:"개발은 끝이 없어요 그러니깐 그러니깐 맘비우고 편안히 하시면 어느새 완성되어 있을 겁니다.", swrittenDate:"19/02/34", swriterName:"이원진", swriterLevel:1, spostTitle:"니모를찾아서", swriterImage:"dummyProfile", suploadedImage:  [UploadedImage.init(imageName:"1"),UploadedImage.init(imageName:"2"),UploadedImage.init(imageName:"3"),UploadedImage.init(imageName:"4"),UploadedImage.init(imageName:"5")])
    
        
        self.dummy = [one,two]
        
        self.photoData = [AdverTising.init(title:"개발자에게 필요한 툴 알아보기 제1탄!", photos:"1"),AdverTising.init(title:"개발자에게 필요한 툴 알아보기 제2탄!", photos:"2"),AdverTising.init(title:"개발자에게 필요한 툴 알아보기 제3탄!", photos:"3"),AdverTising.init(title:"개발자에게 필요한 툴 알아보기 제4탄!", photos:"4"),AdverTising.init(title:"개발자에게 필요한 툴 알아보기 제5탄!", photos:"5"),AdverTising.init(title:"개발자에게 필요한 툴 알아보기 제5탄!", photos:"6")]
        
     
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
            
            timeLineCell.contfigure(data, vc: self)
            
        }
        return timeLineCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let lookPostVC = self.storyboard?.instantiateViewController(withIdentifier:"LookPostVC") as! LookPostVC
        
        lookPostVC.selecteData = self.dummy?[indexPath.row]
        self.navigationController?.pushViewController(lookPostVC, animated:true)
        
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
