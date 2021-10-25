//
//  DbManager.swift
//  AIS_GAI
//
//  Created by Admin on 23.10.2021.
//

import Foundation
import RealmSwift

enum RuntimeError: Error {
    case NoRealmSet
}

class DbManager{
    
    var realm: Realm?

        public func saveNotes(_ note: NoteModel) throws
        {
            if (realm != nil) {
                try! realm!.write {
                    realm!.add(note)
                }
            } else {
                throw RuntimeError.NoRealmSet
            }
        }

        public func getNotes() throws -> Results<NoteModel>
        {
            if (realm != nil) {
                return realm!.objects(NoteModel.self)
                throw RuntimeError.NoRealmSet
            }
            else{
                throw RuntimeError.NoRealmSet
            }
        }
}
