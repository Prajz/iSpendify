//
//  RecentTransactionsView.swift
//  iSpendify
//
//  Created by Dev Prajapati on 29/01/2023.
//

import SwiftUI
import Foundation

struct RecentTransactionsView: View {
    
    @Environment (\.managedObjectContext) var mox
    @FetchRequest (sortDescriptors: [NSSortDescriptor(key: "datec", ascending: false)]) var trans : FetchedResults<Tra>
    
    func createformatter() -> DateFormatter{
        let form = DateFormatter()
        form.dateStyle = .medium
        form.timeZone = .current
        
        return form
    }

    var body: some View {
        ScrollView{
                ZStack{
                    VStack{
                        ForEach(trans){ item in
                            HStack(spacing:20){
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color.icon.opacity(0.45))
                                    .frame(width: 50, height: 50)
                                    .overlay {
                                        if (item.categoryc == "Transport") {
                                            Image(systemName: "bus")
                                            //.foregroundColor(.white)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        if (item.categoryc == "Software") {
                                            Image(systemName: "macbook.and.iphone")
                                            //.foregroundColor(.white)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        if (item.categoryc == "Food") {
                                            Image(systemName: "fork.knife")
                                            //.foregroundColor(.white)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        if (item.categoryc == "Leisure") {
                                            Image(systemName: "figure.skiing.downhill" )
                                            //.foregroundColor(.white)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        if (item.categoryc == "Health") {
                                            Image(systemName: "stethoscope")
                                            //.foregroundColor(.white)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        if (item.categoryc == "Work") {
                                            Image(systemName: "latch.2.case")
                                            //.foregroundColor(.white)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                    }
                                VStack(alignment: .leading, spacing: 4){
                                    //MARK: Transaction merchant
                                    Text(item.merchantc ?? "non")
                                        .font(.subheadline)
                                        .bold()
                                        .lineLimit(1)
                                    
                                    //MARK: Transaction Category
                                    Text(item.categoryc ?? "none")
                                        .font(.footnote)
                                        .opacity(0.7)
                                        .lineLimit(1)
                                    let form = createformatter()
                                    
                                    //MARK: Transaction Date
                                    Text(form.string(from:item.datec ?? Date()))
                                        .font(.footnote)
                                        .opacity(0.7)
                                    
                                }
                                Spacer()
                                let bong = item.amountc
                                let bongd = NumberFormatter().number(from: bong!)?.doubleValue
                                let roundbong = round((bongd ?? 0.0) * 100) / 100
                                let b: String = String(format: "%.2f", roundbong)
                                
                                if (item.isExpensec == true){
                                    Text("£\(b)")
                                }else{
                                    Text("+ £\(b)")
                                        .foregroundColor(.mint)
                                }
                                //MARK: Transaction Amount
                                
                                //.foregroundColor()
                            }
                            .padding([.top, .bottom], 11)
                            .padding(.horizontal)
                            .foregroundColor(Color.text)
                            .background(Color.background)
                            Divider()
                        }
                        .onDelete(perform: deletetrans)
                    }
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                EditButton()
            }
            
        }
        .navigationTitle("Transactions")
        .background(Color.background)
        .scrollContentBackground(.hidden)
    }
    func deletetrans(at offsets: IndexSet){
        for offset in offsets {
            let transactino = trans[offset]
            mox.delete(transactino)
        }
        try? mox.save()
    }
}

struct RecentTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        RecentTransactionsView()
    }
}
