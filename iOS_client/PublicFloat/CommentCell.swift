//
//  CommentCell.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/10/19.
//  Copyright © 2015年 YellowTeam. All rights reserved.
//

import Foundation
import UIKit

class CommentCell: UITableViewCell
{
    
    @IBOutlet var commentContent: UILabel!
    @IBOutlet var commentName: UILabel!

 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
