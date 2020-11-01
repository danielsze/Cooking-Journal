//
//  HomeView.swift
//  Cooking Journal
//
//  Created by Széplaki Dániel on 2020. 11. 01..
//

import SwiftUI

struct HomeView: View {
    
    
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        Button(action: {
            dataController.DeleteAll()
            try? dataController.CreateSampleData()
        }){
            Text("Add data")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
