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
    
    var emo = Emotion(id: 0,emotion_name: "",artwork_id: 0)
    
    var art = ArtWork(artwork_id:0, name: " ", imageUrl: " ", location: " ")
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descButt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named:art.imageUrl)
        
        descButt.setTitle(art.location, for: UIControlState())
        
        //descButt.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        //commButt.setTitle("Comment", forState: .Normal)
        
        navigationItem.title = art.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tocomment" {
            let viewController = segue.destination as! CommentViewController
            
            viewController.current_artwork = self.art
             viewController.emo = self.emo
        }
        
    }

    
    @IBAction func shareTapped(_ sender: AnyObject) {
        let controller: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        controller.setInitialText(art.name)
        controller.add(UIImage(named: art.imageUrl))
        self.present(controller, animated: true, completion: nil)
    }

}
