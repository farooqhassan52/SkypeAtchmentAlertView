//
//  CutomViewHeaderCell.swift
//  USafe
//
//  Created by Rana Farooq on 03/02/2020.
//  Copyright © 2020 Rana Latif. All rights reserved.
//

import UIKit

class CutomAlertViewHeaderCell: UITableViewCell {

    var croxxButtonAction : (()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBAction func croxxButton(_ sender: Any) {
        croxxButtonAction?()
    }
    
    
}
