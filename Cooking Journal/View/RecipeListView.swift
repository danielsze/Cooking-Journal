//
//  ContentView.swift
//  Cooking Journal
//
//  Created by Széplaki Dániel on 2020. 10. 31..
//

import SwiftUI

struct RecipeListView: View {
    
    let recipes : FetchRequest<Recipe>
    
    init() {
        recipes = FetchRequest<Recipe>(entity: Recipe.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \Recipe.creationDate, ascending: false)
        ])
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(recipes.wrappedValue){recipe in
                    NavigationLink(
                        destination: RecipeDetailView(),
                        label: {
                            Text(recipe.name ?? "")
                        })
                        
                }
                .onDelete(perform: { indexSet in
                })
            }
            
            
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Recipes")
            
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
