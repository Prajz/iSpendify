//
//  iSpendifyApp.swift
//  iSpendify
//
//  Created by Dev Prajapati on 28/01/2023.
//

import SwiftUI

@main
struct iSpendifyApp: App {
    
    @StateObject var authen = Authentication()
    
    var body: some Scene {
        WindowGroup {
            if authen.isvali {
                TabView{
                    NavigationStack{
                        HomeView()
                        //RecentTransactionsView()
                    }
                    .tabItem{
                        Image("airplane.circle.fill")
                        Text("Overview")
                        
                    }
                    NavigationStack{
                        RecentTransactionsView()
                    }
                    .tabItem{
                        Image("creditcard")
                        Text("Transactions")
                    }
                    .navigationViewStyle(.columns)
                    NavigationStack{
                        SettingsView()
                    }
                    .tabItem{
                        Image("creditcard")
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
