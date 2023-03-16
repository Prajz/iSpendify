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
    @FetchRequest (sortDescriptors: []) var trans : FetchedResults<Tra>
    let dateformatter = DateFormatter()
    
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
                                    Image(systemName: "airplane")
                                    //.foregroundColor(.white)
                                        .resizable()
                                        .frame(width: 30, height: 30)
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
                                
                                //MARK: Transaction Date
                                Text(dateformatter.string(from: item.datec ?? Date()))
                                    .font(.footnote)
                                    .opacity(0.7)
                                
                            }
                            //.padding([.top, .bottom], 100)
                            
                            Spacer()
                            
                            //MARK: Transaction Amount
                            Text(item.amountc ?? "noneee")// .currency(code: "gbp"))
                            
                            //.foregroundColor()
                        }
                        .padding([.top, .bottom], 11)
                        .padding(.horizontal)
                        .foregroundColor(Color.text)
                        .background(Color.background)
                    }
                }
            }
            }
            .navigationTitle("Transactions")
            .background(Color.background)
            .scrollContentBackground(.hidden)
    }
}

struct RecentTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        RecentTransactionsView()
    }
}
