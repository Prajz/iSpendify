//
//  RecentTransactionsView.swift
//  iSpendify
//
//  Created by Dev Prajapati on 29/01/2023.
//

import SwiftUI

struct RecentTransactionsView: View {
    var body: some View {
        VStack{
            List{
                ForEach(transactionPreviewData){ item in
                    TestRowView(transaction: item)
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
