//
//  TableViewCell.swift
//  Firebase Realtime Database Example Project
//
//  Created by Zulwiyoza Putra on 2/1/17.
//  Copyright © 2017 zulwiyozaputra. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
