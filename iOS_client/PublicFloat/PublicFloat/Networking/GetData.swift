//
//  GetData.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/10/9.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation
import SwiftyJSON
import AFNetworking
import CoreData



class GetData{
    
 
     func fetchEmotions(successCallback: ([Emotion]) -> Void, error: ((NSError?) -> Void)?) {
        
        let manager = AFHTTPRequestOperationManager()
        manager.GET("http://localhost:3000/emotions.json", parameters: nil, success: { (operation ,responseObject) -> Void in
               let results = JSON(responseObject)
                var emotions: [Emotion] = []
                for (key, subJson) in results {
                    if let title = subJson["emotion_name"].string{
                        var artid = subJson["artwork_id"].int!
                        var ida = subJson["id"].int!
                        
                        emotions.append(Emotion(id: ida,emotion_name: title,artwork_id: artid))
                    }
                
            }
                successCallback(emotions)
                
        },
            failure: { (operation, requestError) -> Void in
                if let errorCallback = error {
                    errorCallback(requestError)
                }
        })
    }
    
    
    func fetchAllArtworks(successCallback: ([ArtWork]) -> Void, error: ((NSError?) -> Void)?) {
        let manager = AFHTTPRequestOperationManager()
        manager.GET("http://localhost:3000/artworks.json", parameters: nil, success: { (operation ,responseObject) -> Void in
            let results = JSON(responseObject)
            var artworks: [ArtWork] = []
            for (key, subJson) in results {
                if let title = subJson["name"].string{
                    
                    var artwork_id = subJson["id"].int
                    var imageurl = subJson["image_url"].string
                    var long = subJson["artwork_longtitude"].string!
                    var latt = subJson["artwork_latitude"].string!
                    var ida = "artwork_longtitude: \(long) + artwork_latitude: \(latt)"
                    
                    artworks.append(ArtWork(artwork_id: artwork_id!, name: title, imageUrl: imageurl!, location: ida))
                }
                
            }
            successCallback(artworks)
            
            },
            failure: { (operation, requestError) -> Void in
                if let errorCallback = error {
                    errorCallback(requestError)
                }
        })
    }
    
    
    func fetchAllComments(successCallback: ([Comment]) -> Void, error: ((NSError?) -> Void)?) {
        let manager = AFHTTPRequestOperationManager()
        manager.GET("http://localhost:3000/comments.json", parameters: nil, success: { (operation ,responseObject) -> Void in
            let results = JSON(responseObject)
            var comments: [Comment] = []
            for (key, subJson) in results {
                if let comment_text = subJson["comment"].string{
                    var userid = subJson["user_id"].int
                    var commentid = subJson["id"].int
                    var artwork_id = subJson["artwork_id"].int
        
                    comments.append(Comment(comment_text: comment_text,user_id:userid!, comment_id: commentid!,artwork_id:artwork_id!))
                }
                
            }
            successCallback(comments)
            
            },
            failure: { (operation, requestError) -> Void in
                if let errorCallback = error {
                    errorCallback(requestError)
                }
        })
    }


    

    

    
}
