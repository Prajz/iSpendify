//
//  ContentView.swift
//  iSpendify
//
//  Created by Dev Prajapati on 28/01/2023.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    
    @EnvironmentObject var authentication: Authentication
    
    @State private var unlocked = false
    @State private var text = "LOCKED"
    var body: some View {
        VStack {
            Image(systemName: "faceid")
                .resizable()
                .frame(width: 80, height: 80, alignment: .bottom)
                .foregroundColor(Color.icon)
            Button("Tap here to login with FaceID")
            {
                auth()
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color.icon)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.orange,.green], startPoint: .topTrailing, endPoint: .bottomLeading))
    }
    
    func auth() {
        let context = LAContext()
        var error: NSError?

        // Check whether it's possible to use biometric authentication
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {

            // Handle events
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "This is a security check reason.") { success, authenticationError in
                
                if success {
                    authentication.isvali = true
                } else {
                    text = "There was a problem!"
                }
            }
        } else {
            print("er")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
