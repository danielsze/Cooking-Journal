//
//  Recipe-CoreDataHelper.swift
//  Cooking Journal
//
//  Created by Széplaki Dániel on 2020. 11. 01..
//

import Foundation

extension Ingredient{
    
    
    static var example : Ingredient{
        let controller = DataController.preview
        let context = controller.container.viewContext
        
        let res = Ingredient(context: context)
        res.name = "Example Ingredient"
        res.quantity = "5 tbps"
        res.recipe = Recipe(context: context)
        return res
    }
    
    
    var ingredientName : String{
        name ?? ""
    }
}
