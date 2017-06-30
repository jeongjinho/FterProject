//
//  LauchNetWork.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 30..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper



class LauchNetworking: NSObject{

     let baseURL = "http://52.78.166.21:3000/login"
    
    var view : NetworkingCallBack
    
    init(_ view:NetworkingCallBack){
        self.view = view
    }
}

class LoginResultModel:Mappable{
    
    var nickName: String?
    var part: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        nickName <- map["id"]
        part <- map["username"]
       
        
    }

}


class LoginModel:Mappable{

    var result: [LoginResultModel]?
    var message: String?

    required init?(map: Map) {
        
    }
    

    func mapping(map: Map) {
        
        result <- map["result"]
        message <- map["message"]
        
        
    }
}


class LoginNetworkModel : LauchNetworking{

    func getUserLoginInfo(id: String){
        
        let URL : String = "\(baseURL)"

        let body : [String:String] = [
            
            
            "id": id,
           
            
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding:JSONEncoding.default, headers:nil).responseObject { (response : DataResponse<LoginModel>) in
            
            switch response.result{
                
            case .success:
                
                guard let boardList = response.result.value else{
                    return
                }
                
                if let results = boardList.message {
                    print("!@#!@#")
                    self.view.networkResult(resultData: results, code: "1-1")
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }

            
        }
    }

}
