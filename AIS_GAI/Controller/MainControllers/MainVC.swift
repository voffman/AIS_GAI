//
//  ViewController.swift
//  AIS_GAI
//
//  Created by Admin on 15.10.2021.
//

import UIKit
import RealmSwift

class MainVC: UIViewController {
    
    let realm = try! Realm()
    
    
    private var mainView: MainView!{
        guard isViewLoaded else { return nil }
        return (view as! MainView)
    }
    
    
    @IBAction func eraseFinesButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Предупреждение", message: "Вы действительно хотите удалить выбранные записи?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Да", style: UIAlertAction.Style.destructive, handler: { _ in
            do{
                try self.realm.write {
                    self.realm.delete(self.realm.objects(FineModel.self))
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func eraseVehiclesButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Предупреждение", message: "Вы действительно хотите удалить выбранные записи?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Да", style: UIAlertAction.Style.destructive, handler: { _ in
            do{
                try self.realm.write {
                    self.realm.delete(self.realm.objects(VehicleModel.self))
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func eraseNotesButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Предупреждение", message: "Вы действительно хотите удалить выбранные записи?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Да", style: UIAlertAction.Style.destructive, handler: { _ in
            do{
                try self.realm.write {
                    self.realm.delete(self.realm.objects(NoteModel.self))
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func eraseAllButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Предупреждение", message: "Вы действительно хотите удалить выбранные записи?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Да", style: UIAlertAction.Style.destructive, handler: { _ in
            do{
                try self.realm.write {
                    self.realm.deleteAll()
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.configureView()
        
    }
}


