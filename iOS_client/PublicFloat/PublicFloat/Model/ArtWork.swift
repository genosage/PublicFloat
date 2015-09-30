//
//  ArtWork.swift
//  PublicFloat
//
//  Created by Albert Wang on 7/09/2015.
//  Copyright (c) 2015 YellowTeam. All rights reserved.
//

import Foundation

public class ArtWork: NSObject {
    
    var artwork_id: Int = 0
    var name: String = ""
    var artwork_longtitude = 0
    var artwork_latitude = 0
    var imageUrl: String = ""
    var ibeaconuuid = ""

    var title = ""
    var discription = ""
    //didnot included in the schema
    var location: String = ""
    
    init(name: String, imageUrl: String, location: String) {
        self.name = name
        self.location = location
        self.imageUrl = imageUrl
    }
    
}
