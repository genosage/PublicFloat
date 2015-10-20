//
//  CommentView.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/10/12.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation
import AFNetworking
import UIKit

class CommentViewController: UITableViewController{
    
    var users = [User]()
   var emo = Emotion(id: 0,emotion_name: "",artwork_id: 0)
    var current_artwork = ArtWork(artwork_id:0, name: " ", imageUrl: " ", location: " ")
    var comments = [Comment]()
    var newC = Comment(comment_text: "",user_id:0,  comment_id:0, artwork_id: 0)
    
    
    override func viewWillAppear(animated: Bool){

        databody.fetchAllComments({ (allcomment) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                self.comments.removeAll(keepCapacity: true)
                for comment in allcomment{
                    print(comment.artwork_id)
                    if(comment.artwork_id == self.current_artwork.artwork_id){
                     
                        self.comments.append(comment)
                    }
                }
                self.tableView.reloadData()
            })
            }, error: nil)
        databody.fetchAllUsers({ (users) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                for user in users{
                    self.users.append(user)
                }
            })
            }, error: nil)

    }





    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return comments.count  //Currently Giving default Value
        
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell : CommentCell = tableView.dequeueReusableCellWithIdentifier("CCell") as! CommentCell
        cell.commentName.text = "anonymous  Says:"
        cell.commentContent.text = comments[indexPath.row].comment_text
        for user in users{
            if( comments[indexPath.row].user_id == user.user_id){
                
                print(user.user_email)
                cell.commentName.text = user.user_email+"    Say:"
            }
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addInput" {
            let viewController = segue.destinationViewController as! InputViewController
            
            viewController.current_artwork = self.current_artwork
            viewController.emo = self.emo
            
        }
        
        
    }
    
    
}