//
//  CustonViewCell.swift
//  USafe
//
//  Created by Rana Farooq on 03/02/2020.
//  Copyright © 2020 Rana Latif. All rights reserved.
//

import UIKit

class CustomAlertViewcell: UITableViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var myPhotoImageView: UIImageView!
    @IBOutlet weak var titel: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
