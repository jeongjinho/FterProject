//
//  ProfileVC.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 24..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    let imagePicker = UIImagePickerController()
     var menuPickerView = UIPickerView()
    var menuData = ["경영/마케팅","개발","디자인"]

    @IBOutlet weak var profilePhotoButton: UIButton!
    @IBOutlet weak var partTextField: UITextField!
  
    @IBOutlet weak var completeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
      //  self.menuArray ={"경영/마케팅"}
        initialNaViBar()
        initialButton()
        
        
        
        let leftView = UIView()
        leftView.frame = CGRect(x:0, y: 0, width:15, height: 40)
             partTextField.leftViewMode = .always
        partTextField.leftView = leftView
      //~~~~~~~~~~
        let rightImageView = UIImageView()
        rightImageView.image = UIImage(named: "down")
        
        let rightView = UIView()
        rightView.addSubview(rightImageView)
        
        rightView.frame = CGRect(x: partTextField.frame.size.width-40, y: 0, width: 40, height: 40)
        rightImageView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        partTextField.rightViewMode = .always
        partTextField.rightView = rightView
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
        
        menuPickerView.delegate = self
        menuPickerView.dataSource = self
        partTextField.inputView = menuPickerView
        partTextField.inputAccessoryView = CustomPickerView().toolbarForpickerView(vc: self, completeHandler: { () in
            
            //추후나감
            let row = self.menuPickerView.selectedRow(inComponent: 0)
            self.partTextField.text = self.menuData[row]
            self.partTextField.endEditing(true)
            self.partTextField.isEnabled = true
        })
            
            //누르면
        
    }
    
    func initialButton() {
        let btnVM = ButtonViewModel.init(fontColor:AppColors.PupleColor, text: "안녕", borderColor: AppColors.PupleColor, borderWidth: 3, borderRadius:Float(completeButton.frame.height/2), backgroundColor: .white)
        
        self.completeButton.configureButton(style:.fillStyle, buttonVM: btnVM)
    }
    
    func initialNaViBar()  {
        guard let naviBar = self.navigationController?.navigationBar else { return  }
        
        naviBar.shadowNabiBar()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return menuData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return menuData[row]
        
    }

    @IBAction func touchUpInsidePhotoButton(_ sender: UIButton) {
        
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
         present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var  chosenImage = UIImage()
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
      
        profilePhotoButton.setImage(chosenImage, for: .normal)
        profilePhotoButton.imageView?.contentMode = .scaleAspectFill
        dismiss(animated:true, completion: nil)
            
            
            
            
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
