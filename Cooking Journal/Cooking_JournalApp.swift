//
//  Cooking_JournalApp.swift
//  Cooking Journal
//
//  Created by Széplaki Dániel on 2020. 10. 31..
//

import SwiftUI

@main
struct Cooking_JournalApp: App {
    
    @StateObject var dataController : DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
