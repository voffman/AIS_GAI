//
//  FinesDetailVC.swift
//  AIS_GAI
//
//  Created by Admin on 28.10.2021.
//

import UIKit
import RealmSwift

class FinesDetailVC: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // не работают файлы UITableViewCell
    // Это норма, в случае со static tableView
    // можно сделать кастом наподобе cellLabel = self.viewWithTag(100) as! UILabel
    //  но не нужно
    
    var isCanSave = true
    
    var fineModel = FineModel()
    let dateManager = DateManager()
    let imagePickerManager = ImagePickerManager()
    
    
    private var finesDetailView: FinesDetailView!{
        guard isViewLoaded else { return nil }
        return (view as! FinesDetailView)
    }
    
    @IBAction func saveBarButtonItem(_ sender: UIBarButtonItem) {
        fineModel.protocolId = finesDetailView.fineTextField1.text ?? "Поле не заполнено!"
        fineModel.reason = finesDetailView.fineTextField2.text ?? "Поле не заполнено!"
        fineModel.registrationPlate = finesDetailView.fineTextField3.text ?? "Поле не заполнено!"
        fineModel.driverLicenseNumber = finesDetailView.fineTextField4.text ?? "Поле не заполнено!"
        fineModel.photo = imagePickerManager.imageView.image?.jpeg(.medium) // правильнее finesDetailView.imageView !!!
        fineModel.specialMark = finesDetailView.fineTextField5.text ?? "Поле не заполнено!"
        fineModel.protocolDate = dateManager.getCurrentDate()
        
        let realm = try! Realm()
        try! realm.write{
            realm.add(fineModel)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBarButtonItem(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configurateData()
        finesDetailView.configureView()
        finesDetailView.configureCells()
        imagePickerManager.imagePickerController.delegate = self
        
        if isCanSave{
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        }
        else{
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
        
        
        // Do any additional setup after loading the view.
    }
    
}

private extension FinesDetailVC{
    
    func configurateData(){
        
        
        finesDetailView.fineTextField1.text = fineModel.protocolId
        finesDetailView.fineTextField2.text = fineModel.reason
        finesDetailView.fineTextField3.text = fineModel.registrationPlate
        finesDetailView.fineTextField4.text = fineModel.driverLicenseNumber
        if fineModel.photo != nil{
            finesDetailView.fineImageView.image = UIImage(data: fineModel.photo!)
        }
        finesDetailView.fineTextField5.text = fineModel.specialMark
    }
    
    func configure(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension FinesDetailVC: ImagePickerManagerProtocol{
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

private extension FinesDetailVC{
    
    @IBAction func fineGalleryButton(_ sender: UIButton) {
        presentPicker(sourceType: .photoLibrary)
        imagePickerManager.imageView = finesDetailView.fineImageView
        
        self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func fineCameraButton(_ sender: UIButton) {
        presentPicker(sourceType: .camera)
        imagePickerManager.imageView = finesDetailView.fineImageView
        
        self.present(imagePickerManager.imagePickerController, animated: true, completion: nil)
    }
}

