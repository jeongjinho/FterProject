//
//  TimeLineVO.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import ObjectMapper



class PostPhoto : Mappable{
    
    var url : Int?
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        url <- map["id"]
        
        
    }
    
}

class ReplyPerson : Mappable{
    var profilePhoto : String?
    var personName : String?
    var reply : String?
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
      //  url <- map["id"]
        
        
    }
    
}




class Content : Mappable{
    
    var phothos: [PostPhoto]?
    var replyPersons: [ReplyPerson]?
//    var id : Int?
//    var username : String?
//    var title : String?
//    var message : String?
    //   var posted_time : String?
    //  var view_number : Int?
    //  var image : String?
//    var content : String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
//        id <- map["id"]
//        username <- map["username"]
//        title <- map["title"]
        // posted_time <- map["posted_time"]
        //  view_number <- map["view_number"]
        //  image <- map["image"]
       // content <- map["content"]
        
    }
    
}

class TimeLine : Mappable{
    
    var TimeLines : [Content]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        TimeLines <- map["results"]
    }
}




