//
//  HTTPSessionManager.swift
//  PublicFloat
//
//  Created by Albert Wang on 7/09/2015.
//  Copyright (c) 2015 YellowTeam. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import AFNetworking

public enum Emotion: String {
    
    case love = "love"
    case depressed = "depressed"
    case happy = "happy"
}

/**
   Manage Networking.
*/
public class HTTPSessionManager: NSObject {
    
    static let sessionManager = AFHTTPRequestOperationManager()
    
    public static func allArtWorks() -> Observable<(NSDictionary!, NSHTTPURLResponse!)> {

        return create({observer in
            self.sessionManager.GET("/login", parameters:nil, success: { requestOperation, responseObject in
                sendNext(observer, (responseObject as! NSDictionary, requestOperation.response))
                sendCompleted(observer)
                }) { _, error in
                    sendError(observer, error ?? UnknownError)
            }
            return AnonymousDisposable{}
        })
    }
    
    public static func artWorksLinkedWithEmotion(emotion: Emotion) -> Observable<(NSDictionary!, NSHTTPURLResponse!)> {

        return create({observer in
            self.sessionManager.GET("/login", parameters:nil, success: { requestOperation, responseObject in
                 sendNext(observer, (responseObject as! NSDictionary, requestOperation.response))
                 sendCompleted(observer)
            }) { _, error in
                 sendError(observer, error ?? UnknownError)
            }
            return AnonymousDisposable{}
        })
    }
    
    public static func commentsOfArtWork(artWork: String) -> Observable<(NSDictionary!, NSHTTPURLResponse!)> {

        return create({ observer in
            self.sessionManager.GET("/login", parameters:nil, success: { requestOperation, responseObject in
                sendNext(observer, (responseObject as! NSDictionary, requestOperation.response))
                sendCompleted(observer)
                }) { _, error in
                    sendError(observer, error)
            }
            return AnonymousDisposable{}
        })
    }
    
//    public static func sendCommentOfArtwork(comment: String, artwork: String)(success: (AnyObject,AnyObject) -> Void)(failure: (AnyObject,AnyObject) -> Void) -> Void {
//        self.sessionManager.GET("/login", parameters:nil, success: { requestOperation, responseObject in
//            success(requestOperation, responseObject)
//            }) { requestOperation, error in
//            failure(requestOperation, error)
//        }
//    }

}
