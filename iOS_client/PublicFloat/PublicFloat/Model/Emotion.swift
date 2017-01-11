//
//  Emotion.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/30.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation

open class Emotion: NSObject {
    
    var id: Int = 0
    var emotion_name: String = ""
    var artwork_id: Int = 0
    
     init(id:Int, emotion_name: String,artwork_id: Int){
        self.id = id
        self.emotion_name = emotion_name
        self.artwork_id = artwork_id
      
    }
    
}
