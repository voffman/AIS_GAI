//
//  FinesVC.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import UIKit

class FinesVC: UIViewController {
    
    private var finesView: FinesView!{
        guard isViewLoaded else { return nil }
        return (view as! FinesView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fineCell", for: indexPath) as! FineCell
        
       // cell.fineTitleLabel.text = "111"
       // cell.fineDataLabel.text = "00/00/0000"
        
        return cell
    }
}
