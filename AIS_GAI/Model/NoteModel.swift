//
//  NoteModel.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import Foundation
import RealmSwift

class NoteModel: Object {
    
    @Persisted var title: String?
    @Persisted var fullText: String?
    @Persisted var date: Date?

    
}
