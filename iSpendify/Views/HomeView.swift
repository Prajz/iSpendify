//
//  HomeView.swift
//  iSpendify
//
//  Created by Dev Prajapati on 29/01/2023.
//

import SwiftUI


struct HomeView: View {
    
    @Environment (\.managedObjectContext) var mox
    @FetchRequest (sortDescriptors: []) var trans : FetchedResults<Tra>
    @State private var showingAddScreen = false
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{
                        Text("t")
                            .padding()
                    }
                    Text("Trans: \(trans.count)")
                        .padding()
                }
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: .infinity,
                      alignment: .topLeading
                    )
                .toolbar{
                    ToolbarItem{
                        Button{
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add", systemImage: "plus.app")
                                .foregroundColor(Color.icon)
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen){
                    inputView()
                }
                .foregroundColor(Color.text)
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle("Overview")
            }
            .background(Color.background)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
