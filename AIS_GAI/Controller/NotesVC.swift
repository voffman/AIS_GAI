//
//  NotesVC.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import UIKit

class NotesVC: UIViewController {

    private var notesView: NotesView!{
        guard isViewLoaded else { return nil }
        return (view as! NotesView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCell
        

        
        return cell
    }
}


