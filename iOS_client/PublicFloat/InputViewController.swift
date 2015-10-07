//
//  InputViewController.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/30.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation
import UIKit

class InputViewController: UIViewController,UITextFieldDelegate{
    
    
    
    @IBOutlet var input_field: UITextField!
    var content = ""
    
    @IBAction func addComment(sender: UIButton) {
         content = input_field.text
        println(content)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "done" {
            //get destination controller
            var destViewController = segue.destinationViewController as! CommentViewController;
          
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}