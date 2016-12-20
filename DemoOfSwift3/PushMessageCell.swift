//
//  PushMessageCell.swift
//  DemoOfSwift3
//
//  Created by 许之午 on 2016/12/19.
//  Copyright © 2016年 许之午. All rights reserved.
//

import UIKit

class PushMessageCell: UITableViewCell {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblSTitle: UILabel!
    
    var title: String{
        get{
            return self.lblTitle.text!
        }
        set{
            self.lblTitle.text = newValue
        }
    }
    
    var subTitle: String{
        get{
            return self.lblSTitle.text!
        }
        set{
            self.lblSTitle.text = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
