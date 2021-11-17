//
//  MainView.swift
//  AIS_GAI
//
//  Created by Admin on 20.10.2021.
//

import UIKit

class MainView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var eraseFinesButton: UIButton!
    @IBOutlet weak var eraseVehiclesButton: UIButton!
    @IBOutlet weak var eraseNotesButton: UIButton!
    @IBOutlet weak var eraseAllButton: UIButton!
    
    
    func configureView(){
        settingsLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        titleLabel.font = UIFont.init(name: "Times New Roman", size: 60)
    }
    
    
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
}
