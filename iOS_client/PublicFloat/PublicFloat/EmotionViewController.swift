//
//  EmotionViewController.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/17.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation
import UIKit

class EmotionViewController:  UITableViewController
{
    
   
    
    var emojPic = ["1-1","2","3","4"]
    var emojName = ["love", "war", "history", "happy"]
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
       //self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//  override  func numberOfSectionsInTableView(tableView: UITableView) -> Int
//    {
//        return emojPic.count
//    }
    
   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //make sure you use the relevant array sizes
        return emojName.count
    }
    
  override  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : EmotionCell! = tableView.dequeueReusableCellWithIdentifier("ECell") as! EmotionCell
        if(cell == nil)
        {
//            cell = NSBundle.mainBundle().loadNibNamed("ECell", owner: self, options: nil)[0] as! EmotionCell;

         cell = EmotionCell(style: UITableViewCellStyle.Default, reuseIdentifier: "emoCell")
        }
        let stringTitle = emojName[indexPath.row] as String //NOT NSString
        let strName = emojPic[indexPath.row] as String
        cell.emoName.text=stringTitle
        cell.emoPic.image = UIImage(named: strName)
        return cell //as EmotionCell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "artworkRelatedSegue" {
//            if let destination = segue.destinationViewController as? ArtworkListViewController {
//                if let index = tableView.indexPathForSelectedRow()?.row {
//                    print(emojName[index])
//                    destination.emoBelong = self.emojName[index]
//                }
//            }
        }
    }

    }



