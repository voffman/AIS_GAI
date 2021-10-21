//
//  VehicleModel.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import Foundation
import RealmSwift

class VehicleModel: Object {
    
    @Persisted var id = UUID()
    @Persisted var currentOwnerId: String
    @Persisted var newOwnerId: String
    @Persisted var registrationPlate: String
    @Persisted var vehicleRegistrationCert: String
    @Persisted var vehicleInspectionCert: String?
    @Persisted var ownershipDocument: String
    @Persisted var taxPaymentCert: String
    @Persisted var addressDocument: String
    
}
