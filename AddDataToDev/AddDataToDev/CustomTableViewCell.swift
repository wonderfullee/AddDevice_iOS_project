//
//  CustomTableViewCell.swift
//  AddDataToDev
//
//  Created by zhihao li on 4/18/19.
//  Copyright © 2019 zhihao li. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDeviceName: UILabel!
    @IBOutlet weak var imgDevice: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
