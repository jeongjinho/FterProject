//
//  ReplyCell.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ReplyCell: UITableViewCell {

    @IBOutlet weak var replyerNameButton: UIButton!
    @IBOutlet weak var replyTimeLabel: UILabel!
    @IBOutlet weak var replyLabel: UILabel!
 
    @IBOutlet weak var replyerImageView: UIImageView!
    
    var replyVM: Reply?
    
    
    func contfigure(_ model: Reply )  {
        
        self.replyVM = model
        configureReply()
        configureReplyTime()
        configureReplyerName()
        configureReplyerImage()
        
    }

    func configureReplyerName() {
        let vm = ReplyerNameViewModel(indata:replyVM!)
        
        self.replyerNameButton.configureReplyButton(vm!)
    }
    func configureReply() {
        let vm = ReplyViewModel(indata:replyVM!)
        
        self.replyLabel.configureReplyLabel(vm!)
    }
    func configureReplyTime() {
        let vm = ReplyTimeViewModel(indata:replyVM!)
        
        self.replyTimeLabel.configureReplyLabel(vm!)
    }
    func configureReplyerImage() {
        let vm = ReplyerImageModel(indata:replyVM!, my:self.replyerImageView)
        
        self.replyerImageView.configureReplyImage(vm!)
    }
    
    
    
    
  
    
    
    
}
