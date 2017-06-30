//
//  NetworkingModel.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//



import Foundation
import Alamofire
import AlamofireObjectMapper


class CheckNicknameNM: NetwokrModel{
    

    var tailURL = "nickcheck"
 
    func checkNicknameNetworking(nickName:String){
        let url = "\(self.baseURL + self.tailURL)"
        print(url)
        
        let body : [String:String] = [
            
            
            "nickname": nickName,
            
            
            ]
        Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject { (response:DataResponse<CheckNicknameVO>) in
         
            
            switch response.result{
                
            case .success:
                
                guard let result = response.result.value else{
                    return
                }
                
                if let message = result.message {
                    print("!@#!@#")
                    self.view.networkResult(resultData: message, code: "1-1")
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
            
        }

            
            
           
        }
    
    }

    






