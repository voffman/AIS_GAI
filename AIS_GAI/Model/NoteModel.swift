//
//  NoteModel.swift
//  AIS_GAI
//
//  Created by Admin on 19.10.2021.
//

import Foundation
import RealmSwift

class NoteModel: Object {
    
//  @Persisted var id = UUID()
    @Persisted var title: String?
    @Persisted var fullText: String?
    @Persisted var date: Date?
    
   // convenience init(title: String?, fulltext: String?, date: Date?) {
   //     self.title = title
   //     self.fullText = fulltext
   //     self.date = date
   // }
    
    
}
