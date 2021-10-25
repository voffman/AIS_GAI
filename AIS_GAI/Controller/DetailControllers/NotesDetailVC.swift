//
//  NotesDetailVC.swift
//  AIS_GAI
//
//  Created by Admin on 22.10.2021.
//

import UIKit
import RealmSwift

class NotesDetailVC: UIViewController {
    
    // В UIView не получается передавать данные через segue-s (предупреждение: cast from... to unrelated type...)
    //поэтому требуется ViewController

    @IBOutlet weak var notesDetailTitleTF: UITextField!
    @IBOutlet weak var notesDetailFullTextTV: UITextView!
    
    
    var noteModel = NoteModel()
    let dateManager = DateManager()
    let dbManager = DbManager()
    
    private var notesDetailView: NotesDetailView!{
        guard isViewLoaded else { return nil }
        return (view as! NotesDetailView)
    }
    
     @IBAction func cancelBarButtonItem(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBarButtonItem(_ sender: UIBarButtonItem) {
       // print("Сохранено")

        noteModel.title = notesDetailTitleTF.text
        noteModel.fullText = notesDetailFullTextTV.text
        noteModel.date = dateManager.getCurrentDate()
        
        let realm = try! Realm()
        try! realm.write{
            realm.add(noteModel)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func configurateData(){
        notesDetailTitleTF.text = noteModel.title
        notesDetailFullTextTV.text = noteModel.fullText
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        notesDetailView.configureView()
        configurateData()
        
    }
}
