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
    
    @IBOutlet var descButton: UIButton!
    
    @IBOutlet var commButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        var imageView : UIImageView = UIImageView(frame:CGRectMake(10, 50, 300, 300));
                        imageView.image = UIImage(named:art.imageUrl)
        
                        self.view.addSubview(imageView)
        
        
        descButton.frame = CGRectMake(10, 300, 300, 300)
        descButton.setTitle("Location:   "+art.location, forState: .Normal)
        
        commButton.frame = CGRectMake(10, 330, 300, 300)
        commButton.setTitle("Comment", forState: .Normal)

        
    }
    override func viewWillAppear(animated: Bool) {

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