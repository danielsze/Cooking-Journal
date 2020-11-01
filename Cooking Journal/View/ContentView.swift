//
//  ContentView.swift
//  Cooking Journal
//
//  Created by Széplaki Dániel on 2020. 11. 01..
//

import SwiftUI

struct ContentView: View {
    
    @SceneStorage("selectedView") var selectedView : String?
    
    var body: some View {
        TabView(selection: $selectedView) {
            HomeView()
                .tag(HomeView.tag)
                .tabItem {
                    Image(systemName: "house")
                    Text("Recipes")
                }
            RecipeListView()
                .tag(RecipeListView.tag)
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
