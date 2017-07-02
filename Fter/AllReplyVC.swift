//
//  AllReplyVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 29..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class AllReplyVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    @IBOutlet weak var replyWindowBottom: NSLayoutConstraint!

    @IBOutlet weak var replyWindow: UIView!
    @IBOutlet weak var replesTableView: UITableView!
    @IBOutlet weak var menuSegment: DefaultSegment!
    var wid: ReplyWindow?
       var replies: [Reply?]?
    //@IBOutlet weak var menuSegment: DefaultSegment!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow),
                                               name: Notification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide),
                                               name: Notification.Name.UIKeyboardWillHide,
                                               object: nil)
        
        for subView in menuSegment.subviews {
            
            if(subView .isKind(of:UIButton.self) == true){
                
                let btn = subView as! UIButton
                btn.isSelected = false
                
                if(btn.tag == 0){
                    
                    btn.underLineView(isSelect:true)
                }else{
                    btn.underLineView(isSelect: false)
                }
                
            }
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBarController?.tabBar.barTintColor = UIColor.white
//        self.tabBarController?.tabBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.pureNabiBar()
//        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.tabBarController?.tabBar.isTranslucent = false
        setReplyWindowView()

        
        self.replesTableView.delegate = self
        self.replesTableView.dataSource = self
        self.replesTableView.rowHeight = UITableViewAutomaticDimension;
        self.replesTableView.estimatedRowHeight = 80.0;
        
       
    }
    
    func setReplyWindowView(){
       
        
        let window = Bundle.main.loadNibNamed("ReplyWindow", owner:nil, options: nil)?.first as! ReplyWindow
        window.frame = CGRect(x: 0, y:0, width:self.replyWindow.frame.size.width, height:self.replyWindow.frame.size.height)
        window.setDelegateAllReplyVC(vc: self)
        wid = window
        self.replyWindow.addSubview(window)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wid?.inputTextView.resignFirstResponder()
        return true
    }
    
    func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            print(keyboardHeight)
            let duration = (notification.userInfo? [UIKeyboardAnimationDurationUserInfoKey])as? Double
            
            UIView.animate(withDuration:duration!, animations: {
                
                self.replesTableView.contentOffset = CGPoint(x:0, y:0)
                self.replyWindowBottom.constant = 0
                
            })
        }
        
    }
    func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            print(keyboardHeight)
            let duration = (notification.userInfo? [UIKeyboardAnimationDurationUserInfoKey])as? Double
            
            UIView.animate(withDuration:duration!, animations: {
                
                self.replesTableView.contentOffset = CGPoint(x:0, y: keyboardHeight)
                print(self.tabBarController?.tabBar.frame.size.height)
                self.replyWindowBottom.constant = keyboardHeight - (self.tabBarController?.tabBar.frame.size.height)!
                
                
                
            })
        }
        
        
        
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let cnt = replies?.count else { return 0 }
        print(cnt)
        return cnt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let replyCell = Bundle.main.loadNibNamed("ReplyCell", owner:self, options: nil)?.first as! ReplyCell
        if let data = self.replies?[indexPath.row] {
            
            replyCell.contfigureAllReplyVC(data)
            
        }
        return replyCell
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

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillHide, object: nil);
    }
   
    @IBAction func touchUplnsideBackButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
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


