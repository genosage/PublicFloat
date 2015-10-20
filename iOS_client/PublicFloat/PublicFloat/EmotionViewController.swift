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
    
    var current_email = ""
    var emotions = [Emotion]()
    
    var emojPic = ["1-1","2","3","4","4","4","4","4","4","4","4","4","4","1","2","3","4"]
    
    var emoNames:[String] = []
    
    var emoQes = ["Which one puts your imagination into overdrive?",
        "Does something around here get under your skin?",
        "Sign", "???",
        "Personal or political? Use or abuse? Strength or weakness?",
        "Voluptuous? Violent? Routine?",
        "This could change the way you see things.",
        "This one definitely gets your blood boiling.",
        "Stillness, change. Corrosion, healing. Deep time, no time.",
        "Which one brings you down?",
        "Which one lifts you up?","Which one lifts you up?","Which one lifts you up?","Which one lifts you up?"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(current_email==""){
            
            AppDelegate.current_user.user_id = 0
            AppDelegate.current_user.user_email = ""
            
        }else{
            getCurrentUser()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        databody.fetchEmotions({ (emotions,names) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                
                self.emotions = emotions
                self.emoNames = names
                self.tableView.reloadData()
            })
            }, error: nil)
    }
    
    
    func getCurrentUser(){
        
        databody.fetchAllUsers({ (users) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                
                for user in users{
                    
                    AppDelegate.current_user.user_id = user.user_id
                    AppDelegate.current_user.user_email = user.user_email
                    
                }
                self.showAlert()
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
        cell.emoQues.text = ""
        let strName = emojPic[indexPath.row] as String
        cell.emoName.text=emoNames[indexPath.row]
        cell.emoPic.image = UIImage(named: strName)
        cell.emoQues.text=emoQes[indexPath.row]
        return cell //as EmotionCell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "artworkRelatedSegue" {
            if let viewController = segue.destinationViewController as? UITabBarController {
                let tableVC = viewController.viewControllers!.first as! ArtworkListViewController
                if let index = tableView.indexPathForSelectedRow?.row {
                    
                    tableVC.emoBelong = emotions[index]
                    tableVC.emotions = emotions
                }
                
                
            }
        }
        
    }
}
