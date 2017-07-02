//
//  ReplyCell.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ReplyCell: UITableViewCell,ProfileCallBack {

    @IBOutlet weak var replyerNameButton: UIButton!
    @IBOutlet weak var replyTimeLabel: UILabel!
    @IBOutlet weak var replyLabel: UILabel!
 
    @IBOutlet weak var replyerButton: UIButton!
    
    var replyVM: Reply?
    var mainVC: MainTimeLineVC?
    var lookVC: LookPostVC?
    
    func contfigureMainTime(_ model: Reply,vc:MainTimeLineVC )  {
        
        self.replyVM = model
        configureReply()
        //configureReplyTime()
        self.replyTimeLabel.isHidden = true
        configureReplyerName()
        configureReplyerImageButoon()
        self.mainVC = vc
        
        
    }
    
    func contfigureLookPost(_ model: Reply,vc:LookPostVC )  {
        
        self.replyVM = model
        configureReply()
        //configureReplyTime()
        self.replyTimeLabel.isHidden = true
        configureReplyerName()
        configureReplyerImageButoon()
        self.lookVC = vc
        
        
    }
    
    func contfigureAllReplyVC(_ model: Reply )  {
        
        self.replyVM = model
        configureAllReply()
        configureReplyTime()
        configureReplyerName()
        configureReplyerImageButoon()
        
    }

    func configureReplyerName() {
        let vm = ReplyerNameViewModel(indata:replyVM!)
        
        self.replyerNameButton.configureReplyButton(vm!)
    }
    func configureReply() {
        let vm = ReplyViewModel(indata:replyVM!)
        
      
        self.replyLabel.configureReplyLabel(vm!)
    }
    func configureAllReply() {
        let vm = ReplyViewModel(indata:replyVM!)
        
        
        self.replyLabel.configureAllReplyLabel(vm!)
    }
    func configureReplyTime() {
        let vm = ReplyTimeViewModel(indata:replyVM!)
        
        self.replyTimeLabel.configureReplyLabel(vm!)
    }
    func configureReplyerImageButoon() {
        let vm = ReplyerButtonModel(indata:replyVM!, my:self.replyerButton)
        
        self.replyerButton.replyerImageButtonConfigure(vm!)
    }
    
    
    
    
    @IBAction func touchUpInsideProfileButton(_ sender: UIButton) {
        
        let mainVC = ProfileInfoVC(nibName:"ProfileInfoVC", bundle:nil)
        
        mainVC.view.frame = UIScreen.main.bounds
        
        if self.mainVC != nil {
            self.mainVC?.addChildViewController(mainVC)
            self.mainVC?.view.addSubview(mainVC.view)
            mainVC.didMove(toParentViewController: self.mainVC)
            mainVC.getProfileInfoDelegate(callback:self)
        }else {
            self.lookVC?.addChildViewController(mainVC)
            self.lookVC?.view.addSubview(mainVC.view)
            mainVC.didMove(toParentViewController: self.lookVC)
        }
        
        mainVC.getProfileInfoDelegate(callback:self)

    }
  
    
    func cancel(isCancel: Bool) {
        if(isCancel == true){
            DispatchQueue.background(delay: 0.2, background:nil, completion: {
                
                guard let backVC = self.mainVC else { return (self.lookVC!.view.subviews.last?.removeFromSuperview())!  }
                
                backVC.view.subviews.last?.removeFromSuperview()
            })
            
        }
    }

}



    

