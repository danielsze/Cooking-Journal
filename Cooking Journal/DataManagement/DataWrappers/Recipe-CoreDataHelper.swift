//
//  Ingredient-CoreDataHelper.swift
//  Cooking Journal
//
//  Created by Széplaki Dániel on 2020. 11. 01..
//

import Foundation


extension Recipe{
    
    static var example : Recipe{
        let controller = DataController.preview
        let context = controller.container.viewContext
        
        let res = Recipe(context: context)
        res.creationDate = Date()
        res.name = "Example Recipe"
        res.category = "Sandwich"
        res.instructions = []
        for i in 2...Int.random(in: 3...6) {
            let ingredient = Ingredient(context: context)
            ingredient.name = "Example ingredient \(i)"
            ingredient.quantity = "\(i) units"
            ingredient.recipe = res
            res.addToIngredients(ingredient)
        }
        for i in 2...Int.random(in: 3...7) {
            res.instructions?.append("Step \(i) detailed")
        }
        return res
    }
    
    var recipeName : String{
        name ?? ""
    }
    var recipeIngredients : [Ingredient]{
        let array = ingredients?.allObjects as? [Ingredient] ?? []
        return array
    }
}
