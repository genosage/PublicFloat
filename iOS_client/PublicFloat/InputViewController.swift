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
            NSAttributedString(string: "#\(emo.emotion_name)#", attributes:[NSForegroundColorAttributeName : UIColor.grayColor()])
        
    }
    
    @IBAction func addComment(sender: UIButton) {
        content = input_field.text!
        checkContent(content)
        postComment()
        
    }
    
    func checkContent(content:String){
        if(content.containsString("#")){
            var c = content.componentsSeparatedByString("#")
            
            if(c[1] != emo.emotion_name){
                createRelateEmotion(c[1])
            }
        }
    }
    
    func createRelateEmotion(emotiwo:String){
        let manager = AFHTTPRequestOperationManager()
        //"emotion_name":"Curiosity","artwork_id":3
        
        let param = ["emotion":["emotion_name": emotiwo, "artwork_id" : NSNumber(integer: current_artwork.artwork_id)]]
        
        manager.POST( "http://localhost:3000/emotions.json",
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

        var param = ["user_id": NSNumber(integer: AppDelegate.current_user.user_id), "artwork_id" : NSNumber(integer: current_artwork.artwork_id), "comment" : content ];
        manager.POST( "http://localhost:3000/comments.json",
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