//
//  ArtWork.swift
//  PublicFloat
//
//  Created by Albert Wang on 7/09/2015.
//  Copyright (c) 2015 YellowTeam. All rights reserved.
//

import Foundation

public class ArtWork: NSObject {
    
    var id: String = ""
    var name: String = ""
    var location: String = ""
    var imageUrl: String = ""

    
    init(name: String, imageUrl: String, location: String) {
        self.name = name
        self.location = location
        self.imageUrl = imageUrl
    }
    
}
