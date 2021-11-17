//
//  VehiclesDetailView.swift
//  AIS_GAI
//
//  Created by Admin on 29.10.2021.
//

import UIKit

class VehiclesDetailView: UITableView {
    
    @IBOutlet weak var vehicleTitleLabel1: UILabel!
    @IBOutlet weak var vehicleTextField1: UITextField!
    
    @IBOutlet weak var vehicleTitleLabel2: UILabel!
    @IBOutlet weak var vehicleTextField2: UITextField!
    
    @IBOutlet weak var vehicleTitleLabel3: UILabel!
    @IBOutlet weak var vehicleTextField3: UITextField!
    
    @IBOutlet weak var vehicleImageView1: UIImageView!
    @IBOutlet weak var vehicleTitle2Label1: UILabel!
    @IBOutlet weak var vehicleGalleryButton1: UIButton!
    @IBOutlet weak var vehicleCameraButton1: UIButton!
    
    @IBOutlet weak var vehicleImageView2: UIImageView!
    @IBOutlet weak var vehicleTitle2Label2: UILabel!
    @IBOutlet weak var vehicleGalleryButton2: UIButton!
    @IBOutlet weak var vehicleCameraButton2: UIButton!
    
    @IBOutlet weak var vehicleImageView3: UIImageView!
    @IBOutlet weak var vehicleTitle2Label3: UILabel!
    @IBOutlet weak var vehicleGalleryButton3: UIButton!
    @IBOutlet weak var vehicleCameraButton3: UIButton!
    
    @IBOutlet weak var vehicleImageView4: UIImageView!
    @IBOutlet weak var vehicleTitle2Label4: UILabel!
    @IBOutlet weak var vehicleGalleryButton4: UIButton!
    @IBOutlet weak var vehicleCameraButton4: UIButton!
    
    @IBOutlet weak var vehicleImageView5: UIImageView!
    @IBOutlet weak var vehicleTitle2Label5: UILabel!
    @IBOutlet weak var vehicleGalleryButton5: UIButton!
    @IBOutlet weak var vehicleCameraButton5: UIButton!
    
    
    let titles = ["ИИН текущего владельца ТС","ИИН нового владельца ТС","Гос номер автомобиля","Техпаспорт","Техосмотр","Документ, подтверждающий право собственности на ТС","Справка об уплате налога на ТС","Адресная справка"]
    
    func configureView(){
        //  self.backgroundColor = .secondarySystemBackground
    }
    
    func configureCells(){
        vehicleTitleLabel1.text = titles[0]
        vehicleTitleLabel2.text = titles[1]
        vehicleTitleLabel3.text = titles[2]
        vehicleTitle2Label1.text = titles[3]
        vehicleTitle2Label2.text = titles[4]
        vehicleTitle2Label3.text = titles[5]
        vehicleTitle2Label4.text = titles[6]
        vehicleTitle2Label5.text = titles[7]
        
    }
}
