//
//  ArtworkDetailViewController.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/24.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation
import UIKit
import Social

class ArtworkDetailViewController: UIViewController {
    
    var art = ArtWork(artwork_id:0, name: " ", imageUrl: " ", location: " ")
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descButt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named:art.imageUrl)
        
        descButt.setTitle(art.location, forState: .Normal)
        
        //descButt.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        //commButt.setTitle("Comment", forState: .Normal)
        
        navigationItem.title = art.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "tocomment" {
            let viewController = segue.destinationViewController as! CommentView
            
            viewController.current_artwork = self.art
        }
        
    }

    
    @IBAction func shareTapped(sender: AnyObject) {
        var controller: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        controller.setInitialText(art.name)
        controller.addImage(UIImage(named: art.imageUrl))
        self.presentViewController(controller, animated: true, completion: nil)
    }

}