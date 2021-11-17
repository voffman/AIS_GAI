//
//  FinesDetailView.swift
//  AIS_GAI
//
//  Created by Admin on 28.10.2021.
//

import UIKit

class FinesDetailView: UITableView {
    
    @IBOutlet weak var fineTitleLabel1: UILabel!
    @IBOutlet weak var fineTextField1: UITextField!
    
    @IBOutlet weak var fineTitleLabel2: UILabel!
    @IBOutlet weak var fineTextField2: UITextField!
    
    @IBOutlet weak var fineTitleLabel3: UILabel!
    @IBOutlet weak var fineTextField3: UITextField!
    
    @IBOutlet weak var fineTitleLabel4: UILabel!
    @IBOutlet weak var fineTextField4: UITextField!
    
    @IBOutlet weak var fineTitleLabel5: UILabel!
    @IBOutlet weak var fineTextField5: UITextField!
    
    @IBOutlet weak var fineImageView: UIImageView!
    @IBOutlet weak var fineTitle2Label: UILabel!
    @IBOutlet weak var fineGalleryButton: UIButton!
    @IBOutlet weak var fineCameraButton: UIButton!
    
    let titles = ["Номер протокола","Причина остановки","Гос номер автомобиля","Номер ВУ","Фотография с места остановки","Особые пометки"]
    
    func configureView(){
        //  self.backgroundColor = .secondarySystemBackground
    }
    
    func configureCells(){
        fineTitleLabel1.text = titles[0]
        fineTitleLabel2.text = titles[1]
        fineTitleLabel3.text = titles[2]
        fineTitleLabel4.text = titles[3]
        fineTitle2Label.text = titles[4]
        fineTitleLabel5.text = titles[5]
        
    }
}
