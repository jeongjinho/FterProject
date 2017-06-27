//
//  ReplyVO.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import ObjectMapper

//class Reply : Mappable{
//    
//    var replyerImage: URL?
//    var reply: String?
//    var replyerName: String?
//    var replyTime: String?
//    required init?(map: Map) {}
//    
//    func mapping(map: Map) {
//        
//        replyerImage <- map["replyerImage"]
//        reply <- map["reply"]
//        replyerName <- map["replyerName"]
//        replyTime <- map["replyTime"]
//        
//        
//        
//    }
//    
//}

public class Reply: NSObject{
    
    var replyerImage: String?
    var reply: String?
    var replyerName: String?
    var replyTime: String?
    
    init(sreply:String,sreplyerName:String,sreplyTime:String,sreplyerImage:String){
    
        reply = sreply
        replyerName = sreplyerName
        replyTime = sreplyTime
        replyerImage = sreplyerImage
        
    }

}
