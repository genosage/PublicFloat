
//
//  TestModel.swift
//  PublicFloat
//
//  Created by Xing Hu on 20/10/2015.
//  Copyright © 2015 YellowTeam. All rights reserved.
//

import XCTest

class TestModel: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    
    func testUser() {
        
        let user = User.init(user_id:1, user_email: "testUser")
        
        XCTAssertEqual(user.user_id, 1)
        XCTAssertEqual(user.user_email, "testUser")
        
    }
    
    func testArtwork() {
        let artwork = ArtWork.init(artwork_id:2, name: "artwork", imageUrl: "2.img", location: "location")
        
        XCTAssertEqual(artwork.artwork_id, 2)
        XCTAssertEqual(artwork.name, "artwork")
        XCTAssertEqual(artwork.imageUrl, "2.img")
        XCTAssertEqual(artwork.location, "location")
        
    }
    func testEmotion() {
        
        let emo = Emotion.init(id:3, emotion_name: "emo",artwork_id: 2)
        XCTAssertEqual(emo.artwork_id, 2)
        XCTAssertEqual(emo.id, 3)
        XCTAssertEqual(emo.emotion_name, "emo")
        
        
        
    }
    func testComment() {
        
        let comment = Comment.init(comment_text: "commenttest", user_id: 2, comment_id: 3, artwork_id: 4)
        
        XCTAssertEqual(comment.comment_text,"commenttest")
        XCTAssertEqual(comment.user_id,2)
        XCTAssertEqual(comment.comment_id, 3)
        XCTAssertEqual(comment.artwork_id, 4)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
