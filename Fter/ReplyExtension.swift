//
//  ReplyExtension.swift
//  Fter
//
//  Created by 진호놀이터 on 2017. 6. 28..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{

    func configureReplyButton(_ viewModel: TextForCellProtocol) {
        
        self.setTitle(viewModel.title, for: .normal)
             self.setTitleColor(viewModel.textColor, for: .normal)
        
    }
    
    func replyerImageButtonConfigure(_ viewModel: ImageForCellProtocol) {
        
        
        self.setBackgroundImage(viewModel.image, for: .normal)
        self.imageView?.contentMode = .scaleAspectFill
    }
}

