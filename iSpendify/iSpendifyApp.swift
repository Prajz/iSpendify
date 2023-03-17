//
//  iSpendifyApp.swift
//  iSpendify
//
//  Created by Dev Prajapati on 28/01/2023.
//

import SwiftUI

@main
struct iSpendifyApp: App {
    
    @StateObject private var dataController = CoreDataManager()
    
    @StateObject var authen = Authentication()
    
    var body: some Scene {
        WindowGroup {
            if authen.isvali {
                TabView{
                    NavigationStack{
                        HomeView().environment(\.managedObjectContext, dataController.container.viewContext)
                        //RecentTransactionsView()
                    }
                    .tabItem{
                        Image(systemName: "airplane.circle.fill")
                        Text("Overview")
                        
                    }
                    NavigationStack{
                        RecentTransactionsView().environment(\.managedObjectContext, dataController.container.viewContext)
                    }
                    .tabItem{
                        Image(systemName: "creditcard")
                        Text("Transactions")
                    }
                    .navigationViewStyle(.columns)
                    NavigationStack{
                        SettingsView()
                    }
                    .tabItem{
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .environmentObject(authen)
            } else{
                ContentView()
                    .environmentObject(authen)
            }
        }
    }
}
