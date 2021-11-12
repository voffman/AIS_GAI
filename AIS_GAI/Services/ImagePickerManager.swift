//
//  ImagePickerManager.swift
//  AIS_GAI
//
//  Created by Admin on 28.10.2021.
//

import UIKit
import Photos

enum Picker {
case camera
case photoLibrary
}

protocol ImagePickerManagerProtocol: UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    func presentPicker(sourceType: Picker)
}

class ImagePickerManager: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var imageView = UIImageView()
    
    var imagePickerController = UIImagePickerController()
          
    func checkPermissions() {
        if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized {
            PHPhotoLibrary.requestAuthorization({ (status: PHAuthorizationStatus) -> Void in ()
            })
        }

        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
        } else {
            PHPhotoLibrary
                .requestAuthorization(requestAuthorizationHandler)
        }
    }
    
    func requestAuthorizationHandler(status: PHAuthorizationStatus) {
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
            print("Access granted to use Photo Library")
        } else {
            print("We don't have access to your Photos.")
        }
    }

}
