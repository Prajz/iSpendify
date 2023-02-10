//
// Extends.swift
// iSpendify
// Created by Dev Prajapati on 24/01/2023

import Foundation
import SwiftUI

extension Color{
    
    //initialise colors
    
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
    
}

extension DateFormatter {
    static let allNumeric: DateFormatter = {
        print("Init Date formater")
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter
    }()
}


extension String{
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumeric.date(from: self) else { return Date() }
        //in case it fails return today
        
        return parsedDate
    }
}

