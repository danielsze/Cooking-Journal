//
//  RecipeDetailView.swift
//  Cooking Journal
//
//  Created by Széplaki Dániel on 2020. 11. 01..
//

import SwiftUI

struct RecipeDetailView: View {
    
    let recipe : Recipe
    
    @EnvironmentObject var dataController : DataController
    
    @State var name : String
    @State var category : String
    @State var isFavorite : Bool
    @State var ingredients : [Ingredient]
    @State var instructions : [String]
    @State var imageName : String?
    
    init(recipe : Recipe) {
        self.recipe = recipe
        _name = State(wrappedValue: recipe.recipeName)
        _category = State(wrappedValue: recipe.category ?? "")
        _isFavorite = State(wrappedValue: recipe.isFavorite)
        _ingredients = State(wrappedValue: recipe.recipeIngredients)
        _instructions = State(wrappedValue: recipe.instructions ?? [])
        _imageName = State(wrappedValue: recipe.imageName)
    }
    
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Image(imageName ?? "default_food")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                    Spacer()
                }
                    
                Text(recipe.recipeName)
                    .font(.largeTitle)
                    .padding()
                Section(header:Text("Ingredients").font(.title2) ){
                    ForEach(recipe.recipeIngredients, id: \.self){ingredient in
                        HStack{
                            Image(systemName: "sparkle")
                            Text("\(ingredient.quantity ?? "") of \(ingredient.ingredientName)").padding(5.0)
                        }
                    }
                }
                Section(header: Text("Instructions").font(.title2)){
                    ForEach(recipe.instructions ?? [], id: \.self){instruction in
                        HStack{
                            Image(systemName: "hand.point.right.fill")
                            Text(instruction)
                                .padding(5.0)
                        }
                    }
                }
                
                
                Spacer()
            }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
        }
        
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        return RecipeDetailView(recipe: Recipe.example)
    }
}
