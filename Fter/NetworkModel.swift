//
//  NetworkModel.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//


import Foundation


class NetwokrModel : NetworkingCallBack {
    
    
    //internal -  앱, 모듈, 프레임워크의 내부구조를 칭할때
     let baseURL = "https://openapi.naver.com/v1/search/movie.json"
    
    var view : NetworkingCallBack
    
    init(_ view:NetworkingCallBack){
        self.view = view
        
    }
    
    
    func gsno(_ value:String?)-> String{
        
        if let value_ = value{
            return value_
        }else{
            return ""
        }
        
    }//func gsno
    
    func gino(_ value:Int?) -> Int{
        
        if let value_ = value{
            return value_
        }else{
            return 0;
        }
        
    }//func gino
    
    func gbno(_ value:Bool?)->Bool{
        if let value_ = value{
            return value_
        }else
        {
            return false
        }
        
    }//func gbno
    
    func gfno(_ value:Float?)->Float{
        if let value_ = value{
            return value_
        }else
        {
            return 0
        }
        
    }
    //func gfno
    
    func networkResult(resultData: Any, code: String) {
        
    }
    func networkFailed() {
        print("Error : Network")
    }
    
    
    
}
