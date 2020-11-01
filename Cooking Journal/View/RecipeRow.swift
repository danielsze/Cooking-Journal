//
//  RecipeRow.swift
//  Cooking Journal
//
//  Created by Széplaki Dániel on 2020. 10. 30..
//

import SwiftUI

struct RecipeRow: View {
    
    var recipe : Recipe
       
    var body: some View {
        HStack{
            Image("default_food")
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading){
                Text(recipe.name!)
                if let category = recipe.category {
                    Text(verbatim: category)
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                }
            }
            Spacer()
        }
    }
}

struct RecipeRow_Previews: PreviewProvider {
    
    static var previews: some View {
        return RecipeRow(recipe: Recipe.example)
    }
}
