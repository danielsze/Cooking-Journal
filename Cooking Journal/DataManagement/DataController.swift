//
//  DataController.swift
//  PortfolioApp
//
//  Created by Széplaki Dániel on 2020. 10. 31..
//

import Foundation
import CoreData
import SwiftUI

class DataController: ObservableObject{
    let container : NSPersistentCloudKitContainer
    
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Model")
        if inMemory{
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores{storeDescription, error in
            if let error = error{
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
    }
    
    static var preview : DataController = {
        
        let dataController = DataController(inMemory: true)
        let viewContext = dataController.container.viewContext
        do{
            try dataController.CreateSampleData()
        }catch{
            fatalError("Fatal error while creating sample data")
        }
        return dataController
    }()
    
    func Save(){
        if container.viewContext.hasChanges{
            try? container.viewContext.save()
        }
    }
    func Delete(_ object: NSManagedObject){
        container.viewContext.delete(object)
    }
    func DeleteAll(){
        let fetchRequest1 : NSFetchRequest<NSFetchRequestResult> = Ingredient.fetchRequest()
        let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
        _ = try? container.viewContext.execute(batchDeleteRequest1)
        let fetchRequest2 : NSFetchRequest<NSFetchRequestResult> = Recipe.fetchRequest()
        let batchDeleteRequest2 = NSBatchDeleteRequest(fetchRequest: fetchRequest2)
        _ = try? container.viewContext.execute(batchDeleteRequest2)
    }
    
    
    
    func CreateSampleData()throws{
        let viewContext = container.viewContext
        for i in 1...5 {
            let recipe = Recipe(context: viewContext)
            recipe.name = "Project \(i)"
            recipe.ingredients = []
            recipe.creationDate = Date()
            recipe.isFavorite = Bool.random()
            for j in 1...10 {
                let ingredient = Ingredient(context: viewContext)
                ingredient.recipe = recipe
                ingredient.name = "Item \(j)"
                ingredient.quantity = "\(j) units"
                
            }
        }
        try viewContext.save()
    }
}


