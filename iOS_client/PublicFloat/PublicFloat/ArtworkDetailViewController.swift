//
//  ArtworkDetailViewController.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/24.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation

import UIKit

class ArtworkDetailViewController: UIViewController {
    
    var art = ArtWork(name: " ", imageUrl: " ", location: " ")
    
    @IBOutlet var descButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var imageView : UIImageView = UIImageView(frame:CGRectMake(10, 50, 300, 300));
                        imageView.image = UIImage(named:art.name)
        
                        //var descView : UILabel = UILabel(frame:CGRectMake(10, 300, 300, 300));
                        //descView.text = "discription:   "+art.location
                        self.view.addSubview(imageView)
                        //self.view.addSubview(descView)
        
        descButton.frame = CGRectMake(10, 300, 300, 300)
        descButton.setTitle("discription:   "+art.location, forState: .Normal)
        
    }
    override func viewWillAppear(animated: Bool) {
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}