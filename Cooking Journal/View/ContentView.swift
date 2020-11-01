//
//  ContentView.swift
//  Cooking Journal
//
//  Created by Széplaki Dániel on 2020. 11. 01..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Recipes")
                }
            RecipeListView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Recipes")
                }

            }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var dataController = DataController.preview
    
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
