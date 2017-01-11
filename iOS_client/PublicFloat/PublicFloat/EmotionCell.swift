//
//  EmotionCell.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/17.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation

import UIKit

class EmotionCell: UITableViewCell
{

    @IBOutlet var emoPic: UIImageView!

    @IBOutlet var emoName: UILabel!

    @IBOutlet var emoQues: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
