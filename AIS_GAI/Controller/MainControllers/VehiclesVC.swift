//
//  VehicleVC.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import UIKit
import RealmSwift

class VehiclesVC: UIViewController {
    
    
    private var vehiclesView: VehiclesView!{
        guard isViewLoaded else { return nil }
        return (view as! VehiclesView)
    }
    
    let dateManager = DateManager()
    
    let realm = try! Realm()
    let results = try! Realm().objects(VehicleModel.self).sorted(byKeyPath: "protocolDate", ascending: false)
    
    var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
        self.notificationToken = results.observe { (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                self.vehiclesView.tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the TableView
                self.vehiclesView.tableView.beginUpdates()
                self.vehiclesView.tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.vehiclesView.tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.vehiclesView.tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.vehiclesView.tableView.endUpdates()
            case .error(let err):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(err)")
            }
        }
    }
}

private extension VehiclesVC{
    
    func configure(){
        vehiclesView.tableView.delegate = self
        vehiclesView.tableView.dataSource = self
    }
}



extension VehiclesVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCell", for: indexPath) as! VehicleCell
        let object = results[indexPath.row]
        cell.vehicleTitleLabel.text = object.registrationPlate
        cell.vehicleDateLabel.text = dateManager.convertDateToString(date: object.protocolDate)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            realm.beginWrite()
            realm.delete(results[indexPath.row])
            try! realm.commitWrite()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "vehiclesCellSegue"{
            
            if let indexPath = self.vehiclesView.tableView.indexPathForSelectedRow{
                let object = results[indexPath.row]
                let navView = segue.destination as! UINavigationController
                let receiverVC = navView.viewControllers.first as? VehiclesDetailVC
                receiverVC?.vehicleModel.currentOwnerId = object.currentOwnerId
                receiverVC?.vehicleModel.newOwnerId = object.newOwnerId
                receiverVC?.vehicleModel.registrationPlate = object.registrationPlate
                receiverVC?.vehicleModel.vehicleRegistrationCert = object.vehicleRegistrationCert
                receiverVC?.vehicleModel.vehicleInspectionCert = object.vehicleInspectionCert
                receiverVC?.vehicleModel.ownershipDocument = object.ownershipDocument
                receiverVC?.vehicleModel.taxPaymentCert = object.taxPaymentCert
                receiverVC?.vehicleModel.addressDocument = object.addressDocument
                receiverVC?.isCanSave = false
            }
        }
    }
}
