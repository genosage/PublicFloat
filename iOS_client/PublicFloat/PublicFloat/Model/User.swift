//
//  User.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/30.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation

public class User:NSObject {
    

    var user_id: Int = 0
    var user_email: String = ""
    
    init(user_id:Int, user_email: String){
        self.user_id = user_id
        self.user_email = user_email
        
        
    }
    
}