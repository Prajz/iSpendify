//
//  CoreDataManager.swift
//  iSpendify
//
//  Created by Dev Prajapati on 16/02/2023.
//

import Foundation
import CoreData

class CoreDataManager:ObservableObject{
    
    let container = NSPersistentContainer(name: "ExpenModel")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error{
                print("core data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("saved")
        }catch{
            print("big error")
        }
    }
    
    func addtran(name: String, isexp: Bool, date: Date, categoryy : categor, amounte: String, context: NSManagedObjectContext){
        let transa = Tra(context: context)
        transa.id = UUID()
        transa.merchantc = name
        transa.isExpensec = isexp
        transa.datec = date
        transa.categoryc = categoryy.rawValue
        transa.amountc = amounte
        
        save(context: context)
    }

}
