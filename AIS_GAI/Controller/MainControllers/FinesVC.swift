//
//  FinesVC.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import UIKit
import RealmSwift

class FinesVC: UIViewController {
    
    private var finesView: FinesView!{
        guard isViewLoaded else { return nil }
        return (view as! FinesView)
    }
    
    
    let dateManager = DateManager()
    
    let realm = try! Realm()
    let results = try! Realm().objects(FineModel.self).sorted(byKeyPath: "protocolDate", ascending: false)
    
    var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
        self.notificationToken = results.observe { (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                self.finesView.tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the TableView
                self.finesView.tableView.beginUpdates()
                self.finesView.tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.finesView.tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.finesView.tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.finesView.tableView.endUpdates()
            case .error(let err):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(err)")
            }
        }
    }
}

private extension FinesVC{
    
    func configure(){
        finesView.tableView.delegate = self
        finesView.tableView.dataSource = self
    }
}

extension FinesVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fineCell", for: indexPath) as! FineCell
        let object = results[indexPath.row]
        cell.fineTitleLabel.text = object.protocolId
        cell.fineDateLabel.text = dateManager.convertDateToString(date: object.protocolDate)
        
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
        
        if segue.identifier == "finesCellSegue"{
            
            if let indexPath = self.finesView.tableView.indexPathForSelectedRow{
                let object = results[indexPath.row]
                let navView = segue.destination as! UINavigationController
                let receiverVC = navView.viewControllers.first as? FinesDetailVC
                receiverVC?.fineModel.protocolId = object.protocolId
                receiverVC?.fineModel.reason = object.reason
                receiverVC?.fineModel.registrationPlate = object.registrationPlate
                receiverVC?.fineModel.driverLicenseNumber = object.driverLicenseNumber
                receiverVC?.fineModel.photo = object.photo
                receiverVC?.fineModel.specialMark = object.specialMark
            }
        }
    }
}
