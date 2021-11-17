//
//  VehiclesDetailVC.swift
//  AIS_GAI
//
//  Created by Admin on 29.10.2021.
//

import UIKit
import RealmSwift

class VehiclesDetailVC: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var isCanSave = true
    
    var vehicleModel = VehicleModel()
    let dateManager = DateManager()
    let imagePickerManager = ImagePickerManager()
    
    private var vehiclesDetailView: VehiclesDetailView!{
        guard isViewLoaded else { return nil }
        return (view as! VehiclesDetailView)
    }
    
    
    @IBAction func cancelBarButtonItem(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBarButtonItem(_ sender: UIBarButtonItem) {
        
        vehicleModel.currentOwnerId = vehiclesDetailView.vehicleTextField1.text ?? "Поле не заполнено!"
        vehicleModel.newOwnerId = vehiclesDetailView.vehicleTextField2.text ?? "Поле не заполнено!"
        vehicleModel.registrationPlate = vehiclesDetailView.vehicleTextField3.text ?? "Поле не заполнено!"
        
        vehicleModel.vehicleRegistrationCert = vehiclesDetailView.vehicleImageView1.image?.jpeg(.medium)
        vehicleModel.vehicleInspectionCert = vehiclesDetailView.vehicleImageView2.image?.jpeg(.medium)
        vehicleModel.ownershipDocument = vehiclesDetailView.vehicleImageView3.image?.jpeg(.medium)
        vehicleModel.taxPaymentCert = vehiclesDetailView.vehicleImageView4.image?.jpeg(.medium)
        vehicleModel.addressDocument = vehiclesDetailView.vehicleImageView5.image?.jpeg(.medium)
        
        vehicleModel.protocolDate = dateManager.getCurrentDate()
        
        let realm = try! Realm()
        try! realm.write{
            realm.add(vehicleModel)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configurateData()
        vehiclesDetailView.configureView()
        vehiclesDetailView.configureCells()
        imagePickerManager.imagePickerController.delegate = self
        
        if isCanSave{
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        }
        else{
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
}

private extension VehiclesDetailVC{
    
    func configurateData(){
        
        vehiclesDetailView.vehicleTextField1.text = vehicleModel.currentOwnerId
        vehiclesDetailView.vehicleTextField2.text = vehicleModel.newOwnerId
        vehiclesDetailView.vehicleTextField3.text = vehicleModel.registrationPlate
        
        if vehicleModel.vehicleRegistrationCert != nil, vehicleModel.vehicleInspectionCert != nil, vehicleModel.ownershipDocument != nil, vehicleModel.taxPaymentCert != nil, vehicleModel.taxPaymentCert != nil, vehicleModel.addressDocument != nil{
            vehiclesDetailView.vehicleImageView1.image =  UIImage(data: vehicleModel.vehicleRegistrationCert!)
            vehiclesDetailView.vehicleImageView2.image =  UIImage(data: vehicleModel.vehicleInspectionCert!)
            vehiclesDetailView.vehicleImageView3.image =  UIImage(data: vehicleModel.ownershipDocument!)
            vehiclesDetailView.vehicleImageView4.image =  UIImage(data: vehicleModel.taxPaymentCert!)
            vehiclesDetailView.vehicleImageView5.image =  UIImage(data: vehicleModel.addressDocument!)
        }
    }
    
    func configure(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension VehiclesDetailVC: ImagePickerManagerProtocol{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker.sourceType == .photoLibrary {
            imagePickerManager.imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        }
        else {
            imagePickerManager.imageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func presentPicker(sourceType: Picker){
        imagePickerManager.checkPermissions()
        let picker = UIImagePickerController()
        
        if sourceType == Picker.photoLibrary{
            imagePickerManager.imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
        }
        
        if sourceType == Picker.camera{
            picker.sourceType = .camera
            picker.allowsEditing = true
            picker.delegate = self
            present(picker, animated: true)
        }
    }
}

private extension VehiclesDetailVC{
    
    @IBAction func vehicleGalleryButton1(_ sender: UIButton) {
        presentPicker(sourceType: .photoLibrary)
        imagePickerManager.imageView = vehiclesDetailView.vehicleImageView1
        
        self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func vehicleCameraButton1(_ sender: UIButton) {
        presentPicker(sourceType: .camera)
        imagePickerManager.imageView = vehiclesDetailView.vehicleImageView1
        
        self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func vehicleGalleryButton2(_ sender: UIButton) {
        presentPicker(sourceType: .photoLibrary)
        imagePickerManager.imageView = vehiclesDetailView.vehicleImageView2
        
        self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func vehicleCameraButton2(_ sender: UIButton) {
        presentPicker(sourceType: .camera)
        imagePickerManager.imageView = vehiclesDetailView.vehicleImageView2
        
        self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func vehicleGalleryButton3(_ sender: UIButton) {
        presentPicker(sourceType: .photoLibrary)
        imagePickerManager.imageView = vehiclesDetailView.vehicleImageView3
        
        self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func vehicleCameraButton3(_ sender: UIButton) {
        presentPicker(sourceType: .camera)
        imagePickerManager.imageView = vehiclesDetailView.vehicleImageView3
        
        self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func vehicleGalleryButton4(_ sender: UIButton) {
        presentPicker(sourceType: .photoLibrary)
        imagePickerManager.imageView = vehiclesDetailView.vehicleImageView4
        
        self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func vehicleCameraButton4(_ sender: UIButton) {
        presentPicker(sourceType: .camera)
        imagePickerManager.imageView = vehiclesDetailView.vehicleImageView4
        
        self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func vehicleGalleryButton5(_ sender: UIButton) {
        presentPicker(sourceType: .photoLibrary)
        imagePickerManager.imageView = vehiclesDetailView.vehicleImageView5
        
        self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func vehicleCameraButton5(_ sender: UIButton) {
        presentPicker(sourceType: .camera)
        imagePickerManager.imageView = vehiclesDetailView.vehicleImageView5
        
        self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
    }
    
    
}
