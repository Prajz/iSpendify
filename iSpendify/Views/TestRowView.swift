//
//  TestRowView.swift
//  iSpendify
//
//  Created by Dev Prajapati on 01/02/2023.
//

import SwiftUI

struct TestRowView: View {
    
    var transaction: Transactionmodel
    var body: some View {
        HStack(spacing:20){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.45))
                .frame(width: 50, height: 50)
                .overlay {
                    Image(systemName: "key.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            VStack(alignment: .leading, spacing: 4){
                //MARK: Transaction merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                //MARK: Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                //MARK: Transaction Date
                Text(transaction.dateParsed, format: .dateTime.day().month().year())
                    .font(.footnote)
                    .opacity(0.7)
                
            }
            //.padding([.top, .bottom], 100)
            
            Spacer()
            
            //MARK: Transaction Amount
            Text(transaction.signedVal, format: .currency(code: "gbp"))
            
            //.foregroundColor()
        }
        .padding([.top, .bottom], 11)
        .padding(.horizontal)
        .foregroundColor(Color.text)
        .background(Color.background)
    }
}

struct TestRowView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(transactionPreviewData){ item in
            TestRowView(transaction: item)
        }
    }
}
