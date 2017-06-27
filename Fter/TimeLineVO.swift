//
//  TimeLineVO.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import ObjectMapper




public class TimeLine:NSObject {
    
    var replies: [Reply]?
    var replyNumber: Int?
    var likeNumber: Int?
    var postText: String?
    var writtenDate: String?
    var writerName: String?
    var writerLevel: Int?
    var postTitle: String?
    var writerImage: String?
    init(sreplies:[Reply]?,sreplyNumber:Int,slikeNumber:Int,spostText:String,swrittenDate:String,swriterName:String,swriterLevel:Int,spostTitle:String,swriterImage:String) {
        
        replies = sreplies
        replyNumber = sreplyNumber
        likeNumber = slikeNumber
        postText  = spostText
        writtenDate = swrittenDate
        writerName = swriterName
        writerLevel = swriterLevel
        postTitle = spostTitle
        writerImage = swriterImage
    }
    
}

public class AdverTising: NSObject{

    var advertisingPhotos:[AdverTisingPhoto]?

    init(photos:[AdverTisingPhoto]?) {
        advertisingPhotos = photos
    }
}

 class AdverTisingPhoto: NSObject{
    
    var adPhotoName:String?
    
    init(photos:String) {
        adPhotoName = photos
    }
}





