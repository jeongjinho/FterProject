//
//  TimeLineVM.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher




struct TimeLineNameViewModel:TextForCellProtocol {
    
    var title: String
    var textFontStyle: UIFont
    
    init?(indata:TimeLine) {
        
        guard let titleString =  indata.writerName else { return nil }
        self.title = titleString
        self.textFontStyle = UIFont(name:"HelveticaNeue-Bold", size: 13.0)!
    }
}

struct TimeLineLevelViewModel:TextForCellProtocol {
    
    var title: String
    
    
    init?(indata:TimeLine) {
        
        guard let titleString =  indata.writerLevel else { return nil }
        self.title = "\(titleString)"
        
    }
}

struct TimeLineTimeViewModel:TextForCellProtocol {
    
    var title: String
     var textFontStyle: UIFont
    
    init?(indata:TimeLine) {
        
        guard let titleString =  indata.writtenDate else { return nil }
        print(titleString)
        self.title = titleString
         self.textFontStyle = UIFont(name:"HelveticaNeue-Medium", size: 10.0)!
    }
}

struct TimeLinePostViewModel:TextForCellProtocol {
    
    var title: String
    
    
    init?(indata:TimeLine) {
        
        guard let titleString =  indata.postText else { return nil }
        self.title = titleString
        
    }
}

struct TimeLineTitleViewModel:TextForCellProtocol {
    
    var title: String
     var textFontStyle: UIFont
    
    init?(indata:TimeLine) {
        
        guard let titleString =  indata.postTitle else { return nil }
        self.title = titleString
        self.textFontStyle = UIFont(name:"HelveticaNeue-Bold", size: 14.0)!
    }
}

struct TimeLineLikeNumberViewModel:TextForCellProtocol {
    
    var title: String
    var textFontStyle: UIFont
    
    init?(indata:TimeLine) {
        
        guard let titleString =  indata.likeNumber else { return nil }
        self.title = "\(titleString)"
        self.textFontStyle = UIFont(name:"HelveticaNeue-Medium", size: 10.0)!
    }
}

struct TimeLineReplyNumberViewModel:TextForCellProtocol {
    
    var title: String
    var textFontStyle: UIFont
    
    init?(indata:TimeLine) {
        
        guard let titleString =  indata.replyNumber else { return nil }
        self.title = "\(titleString)"
        self.textFontStyle = UIFont(name:"HelveticaNeue-Medium", size: 10.0)!
    }
}


struct TimeLineWriterImageViewModel:ImageForCellProtocol {
    
    var image: UIImage
    var radious: CGFloat
    
    init?(indata:TimeLine,my:UIImageView) {
        
        guard let imageString =  indata.writerImage else { return nil }
            //킹피숴 대체해야함
         self.image = UIImage(named:imageString)!
         self.radious = my.frame.size.width/2
        
    }
}


