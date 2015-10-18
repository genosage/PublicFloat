//
//  EmotionViewController.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/17.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation
import UIKit
import AFNetworking

var databody = GetData()

class EmotionViewController:  UITableViewController
{
    
   
   var emotions = [Emotion]()
    
    var emojPic = ["1-1","2","3","4","4","4","4","4","4","4","4","4","4","1","2","3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAlert()
        
        databody.fetchEmotions({ (emotions) -> Void in
            dispatch_async(dispatch_get_main_queue(), {

                self.emotions = emotions
                self.tableView.reloadData()
            })
            }, error: nil)

    }
    
    

    func showAlert()
    {
        // FIX ME: Current user could be nil.
        let alertController = UIAlertController(title: "Welcome!\(AppDelegate.current_user.user_email)", message: nil, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //make sure you use the relevant array sizes
        return emotions.count
    }
    
  override  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : EmotionCell! = tableView.dequeueReusableCellWithIdentifier("ECell") as! EmotionCell
        if(cell == nil)
        {
//            cell = NSBundle.mainBundle().loadNibNamed("ECell", owner: self, options: nil)[0] as! EmotionCell;

         cell = EmotionCell(style: UITableViewCellStyle.Default, reuseIdentifier: "emoCell")
        }
        let stringTitle = emotions[indexPath.row].emotion_name  //NOT NSString
        let strName = emojPic[indexPath.row] as String
        cell.emoName.text=stringTitle
        cell.emoPic.image = UIImage(named: strName)
        return cell //as EmotionCell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "artworkRelatedSegue" {
            if let viewController = segue.destinationViewController as? UITabBarController {
                 let tableVC = viewController.viewControllers!.first as! ArtworkListViewController
                if let index = tableView.indexPathForSelectedRow?.row {
                    
                    tableVC.emoBelong = emotions[index]
                }

             
                                   }
            }

        }
    }

    



