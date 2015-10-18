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

class CommentView: UITableViewController{
    
    
  
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
        
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        
        cell.textLabel?.text = comments[indexPath.row].comment_text
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addInput" {
            let viewController = segue.destinationViewController as! InputViewController
            
            viewController.current_artwork = self.current_artwork
        }

        
    }
    
    
}