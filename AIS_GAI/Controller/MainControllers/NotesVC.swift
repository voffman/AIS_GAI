//
//  NotesVC.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import UIKit
import RealmSwift

class NotesVC: UIViewController {
    
    private var notesView: NotesView!{
        guard isViewLoaded else { return nil }
        return (view as! NotesView)
    }
    
    let dateManager = DateManager()
    
    let realm = try! Realm()
    let results = try! Realm().objects(NoteModel.self).sorted(byKeyPath: "date", ascending: false)
    
    var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        self.notificationToken = results.observe { (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                self.notesView.tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the TableView
                self.notesView.tableView.beginUpdates()
                self.notesView.tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.notesView.tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.notesView.tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.notesView.tableView.endUpdates()
            case .error(let err):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(err)")
            }
        }
        // Do any additional setup after loading the view.
    }
}

private extension NotesVC{
    
    func configure(){
        notesView.tableView.delegate = self
        notesView.tableView.dataSource = self
    }
}

extension NotesVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCell
        let object = results[indexPath.row]
        cell.noteTitleLabel.text = object.title
        cell.noteDateLabel.text = dateManager.convertDateToString(date: object.date)
        
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
        
        if segue.identifier == "notesCellSegue"{
            
            if let indexPath = self.notesView.tableView.indexPathForSelectedRow{
                let object = results[indexPath.row]
                let navView = segue.destination as! UINavigationController
                let receiverVC = navView.viewControllers.first as? NotesDetailVC
                receiverVC?.noteModel.title = object.title
                receiverVC?.noteModel.fullText = object.fullText
            }
        }
    }
}


