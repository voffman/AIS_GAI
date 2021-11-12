//
//  VehicleModel.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import Foundation
import RealmSwift

class VehicleModel: Object {
    

    @Persisted var currentOwnerId: String
    @Persisted var newOwnerId: String
    @Persisted var registrationPlate: String
    @Persisted var vehicleRegistrationCert: Data?
    @Persisted var vehicleInspectionCert: Data?
    @Persisted var ownershipDocument: Data?
    @Persisted var taxPaymentCert: Data?
    @Persisted var addressDocument: Data?
    @Persisted var protocolDate: Date?
    

}
