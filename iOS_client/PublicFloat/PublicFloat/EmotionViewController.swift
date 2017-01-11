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
    
    var emojPic = ["e1","e2","e3","e4","e5","e6","e7","e8","e9","e10","e11","e12","e13","e14","e15","e16"]
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        databody.fetchEmotions({ (emotions,names) -> Void in
            DispatchQueue.main.async(execute: {
                
                self.emotions = emotions
                self.emoNames = names
                self.tableView.reloadData()
            })
            }, error: nil)
    }
    
    
    func getCurrentUser(){
        
        databody.fetchAllUsers({ (users) -> Void in
            DispatchQueue.main.async(execute: {
                
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
        let alertController = UIAlertController(title: "Welcome!\(AppDelegate.current_user.user_email)", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //make sure you use the relevant array sizes
        return emotions.count
    }
    
    override  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell : EmotionCell! = tableView.dequeueReusableCell(withIdentifier: "ECell") as! EmotionCell
        if(cell == nil)
        {
            //            cell = NSBundle.mainBundle().loadNibNamed("ECell", owner: self, options: nil)[0] as! EmotionCell;
            
            cell = EmotionCell(style: UITableViewCellStyle.default, reuseIdentifier: "emoCell")
            
        }
        cell.emoQues.text = ""
        let strName = emojPic[indexPath.row] as String
        cell.emoName.text=emoNames[indexPath.row]
        cell.emoPic.image = UIImage(named: strName)
        cell.emoQues.text=emoQes[indexPath.row]
        return cell //as EmotionCell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "artworkRelatedSegue" {
            if let viewController = segue.destination as? UITabBarController {
                let tableVC = viewController.viewControllers!.first as! ArtworkListViewController
                if let index = tableView.indexPathForSelectedRow?.row {
                    
                    tableVC.emoBelong = emotions[index]
                    tableVC.emotions = emotions
                }
                
                
            }
        }
        
    }
}
