//
//  TransactionModel.swift
//  iSpend
//
//  Created by Dev Prajapati on 25/01/2023.
//

import Foundation

struct Transactionmodel: Identifiable {
    let id: String = UUID().uuidString
    let date: String
    var merchantc: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    var isTransfer: Bool
    var isExpense: Bool
    
    var dateParsed: Date{
        date.dateParsed()
    }
    
    var signedVal: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
        //returns positive or negative
    }
    
    
}

enum TransactionType: String{
    case debit = "debit"
    case credit = "credit"
}
