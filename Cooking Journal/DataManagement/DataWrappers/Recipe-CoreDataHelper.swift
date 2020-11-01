//
//  Ingredient-CoreDataHelper.swift
//  Cooking Journal
//
//  Created by Széplaki Dániel on 2020. 11. 01..
//

import Foundation


extension Recipe{
    var recipeName : String{
        name ?? ""
    }
    var recipeIngredients : [String]{
        let array = ingredients?.allObjects as? [String] ?? []
        return array
    }
}
