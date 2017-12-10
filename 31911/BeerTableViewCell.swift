//
//  BeerTableViewCell.swift
//  31911
//
//  Created by Alexandre Cini on 10/12/2017.
//  Copyright © 2017 Alexandre Cini. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var lbname: UILabel!
    @IBOutlet weak var lbAbv: UILabel!
    @IBOutlet weak var imFig: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
