//
//  VehicleVC.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import UIKit

class VehiclesVC: UIViewController {
    
    
    private var vehiclesView: VehiclesView!{
        guard isViewLoaded else { return nil }
        return (view as! VehiclesView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCell", for: indexPath) as! VehicleCell
        

        
        return cell
        
    }
    
}
