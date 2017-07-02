//
//  PostingVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class PostingVC: UIViewController,PHSelectionCallback,UICollectionViewDataSource,UICollectionViewDelegate{
    @IBOutlet weak var selectionPHCollectionView: UICollectionView!
    var selectCollectionDeleage: SelectionPHCollectionDelegate?
    
    @IBOutlet weak var postingVieTopConstraint: NSLayoutConstraint!
    var categoryPickerView = UIPickerView()
    var partPickerVeiw = UIPickerView()
      var textfieldDelegate: PostingTextFieldDelegate?
    var partFieldDelegate: PostingTextFieldDelegate?
    var part = ["경영/마케팅","개발","디자인"]
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
  
    var selectData:[PhotoInfo]!
    override func viewDidLoad() {
        super.viewDidLoad()
       
       selectData = []
        textfieldDelegate = PostingTextFieldDelegate(self)
        partFieldDelegate = PostingTextFieldDelegate(self)
         self.partTextField.delegate = textfieldDelegate
        self.categoryTextField.delegate = partFieldDelegate
          self.selectionPHCollectionView.register(UINib(nibName: "AdverTisingCell", bundle: nil), forCellWithReuseIdentifier: "AdverTisingCell")
        // Do any additional setup after loading the view.
        self.initialNaiBar()
     //   selectCollectionDeleage = SelectionPHCollectionDelegate.init(vc:self, selectPhoto:self.selectData)
    
        self.selectionPHCollectionView.delegate = self
           self.selectionPHCollectionView.dataSource = self
       // menuPickerView.delegate = self
      //  menuPickerView.dataSource = self
       
    }

    
    
    func getPHImage(images: [PhotoInfo]) {
      
        self.selectData  = images
        self.selectionPHCollectionView.reloadData()
        
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        print("올라온다")
        
    }
    
    
    
    @IBAction func touchUpInsideBackButton(_ sender: Any) {
        self.dismiss(animated:true, completion:nil)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchUpInsidepicButton(_ sender: UIButton) {
        
        //해당뷰컨가져오고
        let mainVC = MultiPHSelection(nibName:"MultiPHSelection", bundle:nil) as! MultiPHSelection
        //데이터넘기고
        mainVC.selectData = self.selectData
        //차일드로추가하고
         self.addChildViewController(mainVC)
         //크기지정하고
        
         mainVC.view.frame = UIScreen.main.bounds
        //뷰를 추가
        self.view.addSubview(mainVC.view)
        //메인을 부모뷰선정
          mainVC.didMove(toParentViewController:self)
        
        mainVC.getParentSelectionData(parent: self)
    
      //  print(self.selectData)
       
        
    }

    func initialNaiBar()  {
        
        guard let naviBar = self.navigationController?.navigationBar else { return  }
        
        naviBar.shadowNabiBar()
      //  self.navigationController?.setNavigationBarHidden(false, animated:false)
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(selectData.count)
        return selectData.count
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier:"AdverTisingCell", for: indexPath) as! AdverTisingCell
        let vm = PhotoAlbumImage.init(image: selectData[indexPath.row].image!)
        
        photoCell.configureSelectPhoto(vm, isSeleted: photoCell.isSelected)
        
        return photoCell
        
    }
    

    
    
    
    
    
    
}
