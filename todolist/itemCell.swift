//
//  itemCellTableViewCell.swift
//  todolist
//
//  Created by Arsalan on 11/05/2016.
//  Copyright © 2016 PanaCloud. All rights reserved.
//

import UIKit

class itemCell: UITableViewCell {
    
    
    
    
    

    @IBOutlet var vtaskname:UILabel!
    @IBOutlet var vLocation:UILabel!
    @IBOutlet var vtaskpriority:UILabel!
    
    @IBOutlet weak var counter: UILabel!
    
    
    
  
    
    
    func updatecell(){
    
    let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody).fontWithSize(12)
        vtaskname.font = bodyFont
        vLocation.font = bodyFont
        vtaskpriority.font = bodyFont
    
    
    
    
    
    }
    
    
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
