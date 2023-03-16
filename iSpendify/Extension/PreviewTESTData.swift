//
//  PreviewTESTData.swift
//  iSpendify
//
//  Created by Dev Prajapati on 29/01/2023.
//

import Foundation
import SwiftUI

var transactionPreviewData : [Transactionmodel] = [
    Transactionmodel(date: "24/01/2002", merchantc: "Apple", amount: 13.23, type: "debit", categoryId: 801, category: "Software", isTransfer: false, isExpense: true),
    Transactionmodel(date: "23/01/2002", merchantc: "Sony", amount: 426.73, type: "credit", categoryId: 901, category: "Software", isTransfer: true, isExpense: false)
    ]

//var transactionListPreviewData = [Transactionmodel](repeating: transactionPreviewData, count: 10)
