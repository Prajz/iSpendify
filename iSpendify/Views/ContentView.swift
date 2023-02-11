//
//  ContentView.swift
//  iSpendify
//
//  Created by Dev Prajapati on 28/01/2023.
//

import SwiftUI
import LocalAuthentication

struct GButton: ButtonStyle {
    
    @EnvironmentObject var authentication: Authentication
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(Color.text)
            .italic()
            .bold()
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.6 : 1)
                        .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
    }
}

struct ContentView: View {
    
    @EnvironmentObject var authentication: Authentication
    
    @State private var unlocked = false
    @State private var text = "LOCKED"
    var body: some View {
        VStack {
            Spacer()
            
            Text("Welcome back ;)")
                .foregroundColor(Color.text)
                .font(.system(size: 26))
                .italic()
                
            
            Spacer()
            
            Image("welcome-logo")
                .resizable()
                .frame(width: 80, height: 80, alignment: .bottom)
                .foregroundColor(Color.text)
            
            
            Button("Tap here to login with FaceID")
            {
                auth()
            }
            //.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            //.foregroundColor(Color.icon)
            .buttonStyle(GButton())
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.indigo,.purple], startPoint: .topTrailing, endPoint: .bottomLeading))
        //.background(Color.background)
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
