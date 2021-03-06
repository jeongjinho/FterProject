//
//  CustomTimeLineCell.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class CustomTimeLineCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate,ProfileCallBack{

    @IBOutlet weak var likeButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var ImageCollecHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var feelButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var repliesTableView: UITableView!
    @IBOutlet weak var replyNumberLabel: UILabel!
    @IBOutlet weak var likeNumberLabel: UILabel!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var postTextView: UILabel!
    @IBOutlet weak var PostTitleLabel: UILabel!
    @IBOutlet weak var writtenDateLabel: UILabel!
    @IBOutlet weak var writerNameButton: UIButton!
    @IBOutlet weak var writerLevelButton: UIButton!
    @IBOutlet weak var writerImageButton: UIButton!
    @IBOutlet weak var writerPartButton: UIButton!
    @IBOutlet weak var feelButton: UIButton!
    @IBOutlet weak var partButton: UIButton!
    var vc: MainTimeLineVC?
    var onePostVC : LookPostVC?
    var timeLineVM: TimeLine?
   
    var replies: [Reply?]?
    var uploadedDelegate: ImageCollectionDelegate?
    // 더보기삽입 본문에
    var moreText = "...더보기"
    var Point :CGFloat?
    func contfigure(_ model: TimeLine, vc:MainTimeLineVC)  {
     
        self.timeLineVM = model
        self.vc = vc
        configureWriterImageView()
        configureWriterLevelView()
        configureWriterNameView()
        configureWriterDateView()
        configurePostTitleView()
        configurePostTextView()
        configureLikeNumberView()
        configurereplyNumberView()
       
        self.replies = model.replies
        self.repliesTableView.delegate = self
        self.repliesTableView.dataSource = self
        self.repliesTableView.rowHeight = UITableViewAutomaticDimension;
        self.repliesTableView.estimatedRowHeight = 80.0;
        
        
         self.imageCollectionView.register(UINib(nibName: "AdverTisingCell", bundle: nil), forCellWithReuseIdentifier: "AdverTisingCell")
        uploadedDelegate = ImageCollectionDelegate.init(sc:self.vc!, data: (self.timeLineVM?.uploadedImage)!)
        self.imageCollectionView.delegate =  uploadedDelegate
        self.imageCollectionView.dataSource = uploadedDelegate
        
        self.postTextView.isUserInteractionEnabled = true
    
        
        let str = postTextView!.text!
        let range = (str as NSString).range(of: moreText, options: .backwards)
        let attributedStr = NSMutableAttributedString(string: str)
        attributedStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: range)
        postTextView.attributedText = attributedStr
     
        
        print(postTextView.intrinsicContentSize.width)
               print(postTextView.isTruncated())
        let ints = CGFloat(self.postTextView.numberOfLines + 1)
         let size =   postTextView.intrinsicContentSize.width / ints
        
        ////////////////
        self.Point = size
         self.feelButtonHeightConstraint.constant = 0
        self.partButton.isHidden = true
        self.feelButton.isHidden = true
        if(self.timeLineVM?.uploadedImage?.count == 0){
        
         self.ImageCollecHeightConstraint.constant = 0
             self.likeButtonTopConstraint.constant = 0
            
        }
       
       
    }
    
    
    func contfigureOnePost(_ model: TimeLine, vc:LookPostVC)  {
  
        self.timeLineVM = model
        self.onePostVC = vc
        configureWriterImageView()
        configureWriterLevelView()
        configureWriterNameView()
        configureWriterDateView()
        configurePostTitleView()
        configurePostTextView()
        configureLikeNumberView()
        configurereplyNumberView()
        
        self.replies = model.replies
       self.repliesTableView.delegate = self
        self.repliesTableView.dataSource = self
        self.repliesTableView.rowHeight = UITableViewAutomaticDimension;
        self.repliesTableView.estimatedRowHeight = 80.0;
          self.repliesTableView.estimatedSectionFooterHeight = 37
        
        self.imageCollectionView.register(UINib(nibName: "AdverTisingCell", bundle: nil), forCellWithReuseIdentifier: "AdverTisingCell")
        uploadedDelegate = ImageCollectionDelegate.init(lookPostVC:self.onePostVC!, data: (self.timeLineVM?.uploadedImage)!)
        self.imageCollectionView.delegate =  uploadedDelegate
        self.imageCollectionView.dataSource = uploadedDelegate
        
        
        let btnVM = ButtonViewModel.init(fontColor:AppColors.PupleColor, text: "안녕", borderColor: AppColors.PupleColor, borderWidth: 3, borderRadius:Float(feelButton.frame.height/2), backgroundColor: .white)
        
        self.feelButton.DefaultButton(style:.fillStyle, buttonVM: btnVM)
        
        
        
        self.partButton.DefaultButton(style:.fillStyle, buttonVM: btnVM)
    
        if(self.timeLineVM?.uploadedImage?.count == 0){
        
            self.ImageCollecHeightConstraint.constant = 0
            self.likeButtonTopConstraint.constant = 0
        }
    
    }

    
    func configureWriterImageView() {
        let vm = TimeLineWriterButtonViewModel(indata:timeLineVM!, my:self.writerImageButton)
        
        self.writerImageButton.configureTimeLineButtonImage(vm!)
    }
    func configureWriterLevelView() {
        let vm = TimeLineLevelViewModel(indata:timeLineVM!)
        
        self.writerLevelButton.configureTimeLineButton(vm!)
    }

    func configureWriterNameView() {
        let vm = TimeLineNameViewModel(indata:timeLineVM!)
        
        self.writerNameButton.configureTimeLineButton(vm!)
    }
    
    func configureWriterDateView() {
        let vm = TimeLineTimeViewModel(indata:timeLineVM!)
        
        self.writtenDateLabel.configureTimeLineLabel(vm!)
    }
    
    func configurePostTitleView() {
        let vm = TimeLineTitleViewModel(indata:timeLineVM!)
        
        self.PostTitleLabel.configureTimeLineLabel(vm!)
    }
    
    func configurePostTextView() {
        let vm = TimeLinePostViewModel(indata:timeLineVM!)
        
        self.postTextView.configurePostTextView(vm!)
    }
    
    func configureLikeNumberView() {
        let vm = TimeLineLikeNumberViewModel(indata:timeLineVM!)
        
        self.likeNumberLabel.configureTimeLineLabel(vm!)
    }
    
    func configurereplyNumberView() {
        let vm = TimeLineReplyNumberViewModel(indata:timeLineVM!)
        
        self.replyNumberLabel.configureTimeLineLabel(vm!)
    }
    func configureLikeButtonView() {
        let vm = TimeLineLikeOrCotentsButtonViewModel(indata:timeLineVM!, my:self.feelButton)
        
        self.feelButton.configureTimeLineButtonImage(vm!)
    }


    
    @IBAction func touchUpInsideFavoriteButton(_ sender: UIButton) {
        
        print("패보릿버튼눌림")
        if sender.isSelected == false{
        
            sender.isSelected = true
        } else{
        
         sender.isSelected = false
        }
    }

    
    @IBAction func touchUpInsideLikeButton(_ sender: UIButton) {
        
        print("패보릿버튼눌림")
        if sender.isSelected == false{
            
            sender.isSelected = true
        } else{
            
            sender.isSelected = false
        }
    }
    
    @IBAction func touchUpInsideMoreButton(_ sender: UIButton) {
        
        guard let  optVC = self.vc else { return DefaultAlert().basicAlert(title:"더보기", inputMessage:"", viewController:onePostVC!, alertButtonStyle:.TwoButtonStyle) { (
            ) in
            
            } }
        DefaultAlert().basicAlert(title:"더보기", inputMessage:"", viewController: optVC, alertButtonStyle:.TwoButtonStyle) { (
            ) in
            
        }
    }
    
    
    
    @IBAction func touchUpInsideProfileButton(_ sender: Any) {
        

         let mainVC = ProfileInfoVC(nibName:"ProfileInfoVC", bundle:nil)
        
        mainVC.view.frame = UIScreen.main.bounds
        
        if self.vc != nil {
            self.vc?.addChildViewController(mainVC)
            self.vc?.view.addSubview(mainVC.view)
            mainVC.didMove(toParentViewController: self.vc)
        }else {
         self.onePostVC?.addChildViewController(mainVC)
            self.onePostVC?.view.addSubview(mainVC.view)
            mainVC.didMove(toParentViewController: self.onePostVC)
        }
        
        mainVC.getProfileInfoDelegate(callback:self)
        
        
        
    }
    
        
              
       
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // 델리게이트빼내기
    func numberOfSections(in tableView: UITableView) -> Int {
        
     return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            guard let cnt = replies?.count else { return 0 }
        print(cnt)
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let replyCell = Bundle.main.loadNibNamed("ReplyCell", owner:self, options: nil)?.first as! ReplyCell
        if let data = self.replies?[indexPath.row] {
            
            if let current = self.vc{
             replyCell.contfigureMainTime(data, vc: current)
            
            } else{
             replyCell.contfigureLookPost(data, vc: onePostVC!)
            
            }
            
           
            
        }
        return replyCell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView(frame:CGRect(x: 0, y: 0, width:self.frame.size.width, height: 37))
        let replyView = ReplyMoreView.instanceFromNib() as! ReplyMoreView
        footerView.addSubview(replyView)
        replyView.setFromVC(vc: self.onePostVC!)
        return footerView
    }

    //profileCallback
    func cancel(isCancel: Bool) {
        if(isCancel == true){
        DispatchQueue.background(delay: 0.2, background:nil, completion: {
            
            guard let backVC = self.vc else { return (self.onePostVC!.view.subviews.last?.removeFromSuperview())!  }
            
            backVC.view.subviews.last?.removeFromSuperview()
        })
           
        }
}


}

