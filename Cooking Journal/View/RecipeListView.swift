//
//  ContentView.swift
//  Cooking Journal
//
//  Created by Széplaki Dániel on 2020. 10. 31..
//

import SwiftUI

struct RecipeListView: View {
    
    let recipes : FetchRequest<Recipe>
    static let tag : String? = "recipelistview"
    
    init() {
        recipes = FetchRequest<Recipe>(entity: Recipe.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \Recipe.category, ascending: false)
        ])
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(recipes.wrappedValue){recipe in
                    NavigationLink(
                        destination: RecipeDetailView(recipe: Recipe.example),
                        label: {
                            RecipeRow(recipe: recipe)
                        })
                        
                }
                .onDelete(perform: { indexSet in
                })
            }
            
            
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Recipes")
            .navigationBarItems(trailing:Button(action:{
                
            }){Image(systemName: "plus")})
            
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    
    static var dataController = DataController.preview
    
    static var previews: some View {
        RecipeListView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
