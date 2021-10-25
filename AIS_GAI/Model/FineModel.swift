//
//  FineModel.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import Foundation
import RealmSwift

class FineModel: Object {
    
    @Persisted var id = UUID()
    @Persisted var protocolId: Int
    @Persisted var protocolDate: Date
    @Persisted var reason: String
    @Persisted var registrationPlate: String
    @Persisted var driverLicenseNumber: String?
    @Persisted var photo: String?
    @Persisted var specialMark: String?
    
}
