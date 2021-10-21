//
//  VehicleCell.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import UIKit

class VehicleCell: UITableViewCell {

    @IBOutlet weak var vehicleTitleLabel: UILabel!
    @IBOutlet weak var vehicleDataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
