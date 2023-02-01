//
//  ShoeViewModel.swift
//  heinitestcoredata
//
//  Created by Marcel Zimmermann on 31.01.23.
//

import Foundation
import CoreData // implementiert CoreData

// HeadActeur
@MainActor class ShoeViewModel : ObservableObject {
    // Erstellen des NSPersistentContainers
    let container : NSPersistentContainer
    // Veröffentlichlichung darf benutzt werden und auch geändert
    // Variable savedRequests vom Typ ShoeEntity und einem leeren Array
    @Published var savedRequests : [ShoeEntity] = []
   // @Published var savedProfilDatas : [ProfilDataEntity] nachfragen ???
    // initialisierung der NSPersistentDaten
    init(){
        container = NSPersistentContainer(name: "ShoeCoreData") //Attention!!muss der gleiche Name sein wie 
        container.loadPersistentStores { descr, error in
            if let error = error{
                print("error Loading Core Data. \(error)")
            }else{
                print("Core Data Loaded sucessfully.")
            }
        }
        fetchShoe() // Aufruf der Funktion
        

    }
    
    
    
    // ---------------------------------------------------------------//
    // hier kommen die einzelnen Funktionen was alles passieren soll mit den eingegebenen Daten
   
    
    
    // nachfragen ?????
  //  func updateAccountData(profilData : ProfilDataEntity){
        
  //  }
    
    
    
    
    // erstellt ein Update
    func updateShoe(shoe: ShoeEntity){
        shoe.done.toggle()
        saveData()
    }
    // Holen den Schuhfunktion
    func fetchShoe(){
        let request = NSFetchRequest<ShoeEntity>(entityName: "ShoeEntity")
        do{
            savedRequests = try container.viewContext.fetch(request)
        } catch let error{
            print("Error fetching ToDo. \(error)")
        }
    }
    
    // Hinzufügen den Schuhfunktion

    func addShoe(_ desc : String){
        let newShoe = ShoeEntity(context: container.viewContext)
        newShoe.descr = desc
        newShoe.done = false
        saveData()
    }
    
    // Löschen des Schuhs

    func deleteShoe(indexSet : IndexSet){
        for index in indexSet{
            let shoe = savedRequests[index]
            container.viewContext.delete(shoe)
            saveData()
        }
    }
    
    // Funktion zum Abspeichern der Daten
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchShoe()
        }catch let error{
            print("Error saving. \(error)")
        }
    }
    
}


