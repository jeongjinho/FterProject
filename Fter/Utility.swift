//
//  define.swift
//  0408SOPTWork
//
//  Created by 진호놀이터 on 2017. 4. 12..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Swift
import UIKit

/**
 App내에서 공통적으로 자주사용하는 Color를 구조체형식으로 표현
 **/
struct AppColors {
    static let GrayColor = UIColor.init(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1.0)
    static let GreenColor = UIColor.init(red: 103.0/255.0, green: 218.0/255.0, blue: 203.0/255.0, alpha: 1.0)
}

/**
 Login 정보를 전역적으로 사용하기 위해서UserDefault에 저장할
 
 key값들을 상수로 표현한 구조체
 **/
struct UserDefaultString {
    static let ID: String = "id"
    static let PW: String = "pw"
    static let NAME: String = "name"
    static let AGE: String = "age"
    //나중에 쓸때
    static let IsAutoLogin: String = "isAutoLogin"
    
}

/** DefaultAlert class 내에  basicAlert에 필요한
 
 - OneButtonStyle : 기본적인 스타일로 확인버튼 누를시 alert없어짐
 - TwoButtonStyle : 확인버튼외에 취소버튼을 추가 확인버튼 누를 시 dismiss메서드 실행
 ---
 추후에 2개추가 예정
 ---
 **/
enum AlertButtonStyle {
    case  OneButtonStyle
    case  TwoButtonStyle
}




class Utility {
    
    func myLog<T>(object: T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        let info = "\(function)[\(line)]:\(object)"
        print(info)
    }
    static  func dateString(date inputdate: Date, inputFomat:String) -> String {
        
        let date = inputdate
        let formatter = DateFormatter()
        formatter.dateFormat = inputFomat
        
        return   formatter.string(from: date)
    }
    
    static func genderOptString(string optString: String?) -> String{
        
        guard let string = optString else { return "" }
        
        return string
    }
}
// typealias AlertTypeHandler = ((UIAlertAction) ->Void)
class DefaultAlert {
    
    
    /**
     프로젝트 내에서 공통적으로 사용할 커스텀Alert입니다.
     
     - parameters:
     - title: Alert의 상단 가운데 제목
     - inputMessage: 제목 외에 추가적인 내용
     - viewController: action을 사용할 VC(주로 self)
     - alertButtonStyle: OneButton 기본형식과 TwoButton 동작포함형식
     
     closure를 파라미터로 추가예정
     ---
     **/
    
    private var completeHandler: ((Void) -> Void)?
    
    func basicAlert(title:String, inputMessage:String, viewController: UIViewController ,alertButtonStyle:AlertButtonStyle,complete:((Void) -> Void)?) {
        
        let alert = UIAlertController(title: title, message: inputMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        if(alertButtonStyle == AlertButtonStyle.OneButtonStyle){
            
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler:nil))
            
        } else if(alertButtonStyle == AlertButtonStyle.TwoButtonStyle){
            
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: {
                
                //부모뷰찾는거해야함
                alertAction in
                if let vc = viewController.presentationController {
                    viewController.dismiss(animated: true, completion:nil)
                    guard let cpl = complete else{
                        
                        return
                    }
                    cpl()
                    
                }
                
                viewController.navigationController?.popViewController(animated: true)
                
            }))
            
            alert.addAction(UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive, handler:nil))
        }
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
}




class CustomPickerView {
    
    private var completeHandler: ((Void) -> Void)?
    
    /**
     프로젝트 내에서 공통적으로 사용할 커스텀Alert입니다.
     
     - parameters:
     - vc: toolbar의 크기를 지정 할 수 있는 현재VC
     - completeHandler: 확인버튼을 누른 후의 행동을 함수형태롤 지정
     **/
    func toolbarForpickerView(vc :UIViewController,completeHandler: ((Void) -> Void)?) -> UIToolbar{
        
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: vc.view.frame.size.height/4, width: vc.view.frame.size.width, height: 40.0))
        
        let doneButton = BlockBarButtonItem(title: "확인", style: UIBarButtonItemStyle.plain, actionHandler:completeHandler)
        
        toolBar.setItems([doneButton], animated: true)
        
        
        return toolBar
    }
}



class BlockBarButtonItem: UIBarButtonItem {
    private var actionHandler: ((Void) -> Void)?
    
    
    /**
     버튼을 생성하는 생성함수
     
     - parameters:
     - title: doneButton의 title 지정
     - style: UIBarButtonItemStyle을 커스텀지정 기본 .plain
     - completeHandler: 매개변수로 넘어온 complete함수를  1차로 받는 함수에서 호출 할 수 있도록 넘겨줌
     
     **/
    convenience init(title: String?, style: UIBarButtonItemStyle, actionHandler: ((Void) -> Void)?) {
        
        
        self.init(title: title, style: style, target: nil, action: #selector(barButtonItemPressed))
        //        self.init(barButtonSystemItem:style, target:nil, action:#selector(barButtonItemPressed))
        
        self.target = self
        self.title = title
        self.actionHandler = actionHandler
    }
    /*
     - barButtonItemPressed: 확인버튼을 누른후 버튼에서 맨처음 호출하는 함수 이곳에서 다시 complete 함수 호출
     */
    func barButtonItemPressed(sender: UIBarButtonItem) {
        actionHandler?()
    }
}


