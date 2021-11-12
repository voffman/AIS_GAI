//
//  FineModel.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import Foundation
import RealmSwift

class FineModel: Object {
    

    @Persisted var protocolId: String
    @Persisted var protocolDate: Date?
    @Persisted var reason: String
    @Persisted var registrationPlate: String
    @Persisted var driverLicenseNumber: String
    @Persisted var photo: Data?
    @Persisted var specialMark: String

}
