//
//  LookPostVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 28..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class LookPostVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    
   
   
    @IBAction func touchUPInside(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AllReplyVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBOutlet weak var replyWindowBottom: NSLayoutConstraint!
    @IBOutlet weak var wholeView: UIView!
   
    @IBOutlet weak var replyWindow: UIView!
    var wid: ReplyWindow?
    @IBOutlet weak var onePostTableView: UITableView!
    
    var selectedPostIndex: Int?
    var selecteData: TimeLine?
    var arrayData:[TimeLine?]?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.onePostTableView.delegate = self
        self.onePostTableView.dataSource = self
        self.onePostTableView.isScrollEnabled = false
        self.arrayData = [selecteData]
        
      //  setReplyMoreView()
        setReplyWindowView()
  
   
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow),
                                               name: Notification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide),
                                               name: Notification.Name.UIKeyboardWillHide,
                                               object: nil)
        
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
                
                self.onePostTableView.contentOffset = CGPoint(x:0, y:0)
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
                
                self.onePostTableView.contentOffset = CGPoint(x:0, y: keyboardHeight)
                self.replyWindowBottom.constant = keyboardHeight - (self.tabBarController?.tabBar.frame.size.height)!
              
                
               
            })
        }
        
        
    
    
    }
    
    func setReplyWindowView(){
//        let window = ReplyWindow.instanceFromNib()
//        window.frame = self.replyWindow.frame
//        print(self.replyWindow.frame)
//        
//        window.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
//        self.replyWindow.addSubview(window)
        
        let window = Bundle.main.loadNibNamed("ReplyWindow", owner:nil, options: nil)?.first as! ReplyWindow
        window.frame = CGRect(x: 0, y:0, width:self.replyWindow.frame.size.width, height:self.replyWindow.frame.size.height)
        window.setDelegate(vc: self)
        wid = window
        self.replyWindow.addSubview(window)
    }
    
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let timeLineCell = Bundle.main.loadNibNamed("CustomTimeLineCell", owner: self, options:nil)?.first as! CustomTimeLineCell
        if let data = self.arrayData?[indexPath.row] {
            
            timeLineCell.contfigureOnePost(data,vc: self)
            
        }
        return timeLineCell
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillHide, object: nil);
        
    }
    
     @IBAction func touchUpInsidedBackButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
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
