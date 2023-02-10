//
//  Authentication.swift
//  iSpendify
//
//  Created by Dev Prajapati on 09/02/2023.
//

import SwiftUI

class Authentication: ObservableObject{
    @Published var isvali = false
    func updateVali(succ : Bool){
        withAnimation {
            isvali = succ
        }
    }
}
