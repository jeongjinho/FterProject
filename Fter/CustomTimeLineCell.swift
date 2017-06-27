//
//  CustomTimeLineCell.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class CustomTimeLineCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var repliesTableView: UITableView!
    @IBOutlet weak var replyNumberLabel: UILabel!
    @IBOutlet weak var likeNumberLabel: UILabel!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var PostTitleLabel: UILabel!
    @IBOutlet weak var writtenDateLabel: UILabel!
    @IBOutlet weak var writerNameButton: UIButton!
    @IBOutlet weak var writerLevelButton: UIButton!
    @IBOutlet weak var writerImageView: UIImageView!
    var timeLineVM: TimeLine?
    var replies: [Reply?]?
    func contfigure(_ model: TimeLine )  {
        
        self.timeLineVM = model
    
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
        
    }
    
    func configureWriterImageView() {
        let vm = TimeLineWriterImageViewModel(indata:timeLineVM!, my:self.writerImageView)
        
        self.writerImageView.configureTimeLineImage(vm!)
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
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
     return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            guard let cnt = replies?.count else { return 0 }
        
        return cnt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let replyCell = Bundle.main.loadNibNamed("ReplyCell", owner:self, options: nil)?.first as! ReplyCell
        if let data = self.replies?[indexPath.row] {
            
            replyCell.contfigure(data)
            
        }
        return replyCell
    }
    
}
