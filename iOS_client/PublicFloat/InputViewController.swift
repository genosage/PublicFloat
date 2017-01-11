//
//  InputViewController.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/30.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation
import UIKit
import AFNetworking

class InputViewController: UIViewController,UITextFieldDelegate{
    
    var emo = Emotion(id: 0,emotion_name: "",artwork_id: 0)

    var current_artwork = ArtWork(artwork_id:0, name: " ", imageUrl: " ", location: " ")
    
    @IBOutlet var input_field: UITextField!
    
    var content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input_field.attributedPlaceholder =
            NSAttributedString(string: "#\(emo.emotion_name)#", attributes:[NSForegroundColorAttributeName : UIColor.gray])
        
    }
    
    @IBAction func addComment(_ sender: UIButton) {
        content = input_field.text!
        checkContent(content)
        postComment()
        
    }
    
    func checkContent(_ content:String){
        if(content.contains("#")){
            var c = content.components(separatedBy: "#")
            
            if(c[1] != emo.emotion_name){
                createRelateEmotion(c[1])
            }
        }
    }
    
    func createRelateEmotion(_ emotiwo:String){
        let manager = AFHTTPRequestOperationManager()
        //"emotion_name":"Curiosity","artwork_id":3
        
        let param = ["emotion":["emotion_name": emotiwo, "artwork_id" : NSNumber(value: current_artwork.artwork_id as Int)]]
        
        manager.POST( "https://still-scrubland-2068.herokuapp.com/emotions.json",
            parameters: param,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                print("JSON: " + responseObject.description)
                
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                print("Error: " + error.localizedDescription)
                
        })
        
    }
    
    func postComment(){
        let manager = AFHTTPRequestOperationManager()

        var param = ["user_id": NSNumber(value: AppDelegate.current_user.user_id as Int), "artwork_id" : NSNumber(value: current_artwork.artwork_id as Int), "comment" : content ] as [String : Any];
        manager.POST( "https://still-scrubland-2068.herokuapp.com/comments.json",
            parameters: param,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                print("JSON: " + responseObject.description)
                self.navigationController?.popViewControllerAnimated(true)
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                print("Error: " + error.localizedDescription)
                self.navigationController?.popViewControllerAnimated(true)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}
