//
//  Comment.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/30.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation

public class Comment:NSObject {
    
    var comment_id: Int = 0
    var artwork_id: Int = 0
    var user_id: Int = 0
    var comment_text: String = ""
    
    init(comment_text: String,user_id: Int,comment_id:Int, artwork_id:Int){
        self.comment_text = comment_text
        self.user_id = user_id
        self.comment_id = comment_id
        self.artwork_id = artwork_id
    }
}