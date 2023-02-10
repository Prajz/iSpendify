//
//  HomeView.swift
//  iSpendify
//
//  Created by Dev Prajapati on 29/01/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{
                        Text("t")
                            .padding()
                    }
                    
                    Text("test")
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
                        NavigationLink {
                            inputView()
                        } label: {
                            Label("Add", systemImage: "plus.app.fill")
                                .foregroundColor(Color.icon)
                        }
                    }
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
