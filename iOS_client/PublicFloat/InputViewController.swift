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
    
  
    var current_artwork = ArtWork(artwork_id:0, name: " ", imageUrl: " ", location: " ")
    
    @IBOutlet var input_field: UITextField!
    
    var content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func addComment(sender: UIButton) {
        content = input_field.text
        postComment()


    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if segue.identifier == "done" {
//            
//            if   var destViewController = segue.destinationViewController as? CommentView{
//             //   destViewController.newC =
//            }
//          
//        }
//    }
    
    func postComment(){
        let manager = AFHTTPRequestOperationManager()

//        var comment_params = [ "comment":["user_id":current_user?.user_id,"artwork_id":cunrrent_artwork.artwork_id, "comment":content]]
//        var param = ["comment":["user_id":"1","artwork_id":"1","comment":content] ]
        var param = ["user_id": NSNumber(integer: AppDelegate.current_user.user_id), "artwork_id" : NSNumber(integer: current_artwork.artwork_id), "comment" : content ];
        manager.POST( "http://localhost:3000/comments.json",
            parameters: param,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                println("JSON: " + responseObject.description)
                self.navigationController?.popViewControllerAnimated(true)
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
                self.navigationController?.popViewControllerAnimated(true)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}