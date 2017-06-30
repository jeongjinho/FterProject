//
//  CustomTimeLineCell.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class CustomTimeLineCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate {

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
    
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        postTextView.addGestureRecognizer(tapGestureRecognizer)
        
        let str = postTextView!.text!
        let range = (str as NSString).range(of: moreText, options: .backwards)
        let attributedStr = NSMutableAttributedString(string: str)
        attributedStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: range)
        postTextView.attributedText = attributedStr
     
        
        print(postTextView.intrinsicContentSize.width)
               print(postTextView.isTruncated())
//              postTextView.text = String(self.postTextView.text!.characters.dropLast(moreText.characters.count))
//                         while  postTextView.isTruncated() {
//                                let temp = self.postTextView.text!
//                        postTextView.text = String(temp.characters.dropLast(moreText.characters.count))
//                        print(postTextView.text)
//        
//        
//                }
//                postTextView.text = String(self.postTextView.text!.characters.dropLast(moreText.characters.count))
//               
//                let reduceSTr = "\(postTextView.text! + moreText)"
//                print(reduceSTr)
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
    
    func tapGesture(gestureRecognizer:UIGestureRecognizer) {
        
        guard let txt = self.postTextView.text else { return  }
        let touchPoint = gestureRecognizer.location(in:self.postTextView)
        let txtStorage = NSTextStorage(attributedString: NSAttributedString(string: moreText))
        let layoutManager = NSLayoutManager()
        txtStorage.addLayoutManager(layoutManager)
        let  txtContainer = NSTextContainer(size: postTextView.frame.size)
        layoutManager.addTextContainer(txtContainer)
        txtContainer.lineBreakMode = .byWordWrapping
        txtContainer.lineFragmentPadding = 0
            let range = (txt as NSString).range(of:moreText)
        let toRage = (txt as NSString).range(of: moreText)
        let glyphRange = layoutManager.glyphRange(forCharacterRange:range, actualCharacterRange: nil)
        let glyphRect = layoutManager.boundingRect(forGlyphRange: glyphRange, in: txtContainer)
        print(glyphRect)
        print(touchPoint)
       
        print(self.Point)
        let sse = CGFloat(self.postTextView.numberOfLines)
        let ss = self.postTextView.frame.size.width / sse
        print(ss)
        
         let size: CGSize = postTextView.text!.size(attributes: [NSFontAttributeName: UIFont(name: "Helvetica", size: 12.0)!])
         var seeee = (size.width / sse) - self.postTextView.frame.size.width
        
        
        var chas: CGFloat
        if(seeee < 0 ){
        
         chas =  seeee
        } else{
            chas = -seeee

        }
             print(chas)
        if(ss + 30   <= touchPoint.x  ){
            
            print(self.postTextView.frame.size.width)
            print(touchPoint.x)
            
            if(self.postTextView.frame.size.width   >= touchPoint.x  ){
            
           
                if(chas >= 0.0 || self.postTextView.frame.size.width   >= touchPoint.x){
                      //  print("tap")
                    
                    print(Int(chas))
                    if(self.postTextView.frame.size.width   >= touchPoint.x - chas - 30  ){
                         
                        print("tap")

                    }
                }
            }
        
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
    
       // if(self.timeLineVM?.uploadedImage?.count == 0){
        
            self.ImageCollecHeightConstraint.constant = 0
            self.likeButtonTopConstraint.constant = 0
    //    }
    
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
            
            replyCell.contfigure(data)
            
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
    
}
