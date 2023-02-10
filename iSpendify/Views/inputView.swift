//
//  inputView.swift
//  iSpendify
//
//  Created by Dev Prajapati on 31/01/2023.
//

import SwiftUI

class NumbersOnly: ObservableObject{
    @Published var value = "" {
        didSet{
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered{
                value = filtered
            }
        }
    }
}

struct inputView: View {
    
    enum FocusedField{
           case dec
       }
    enum test: Hashable, CaseIterable{
        case a
        case b
    }
    
    
   @State private var path = NavigationPath()
   @State public var expe: Bool = UserDefaults.standard.bool(forKey: "DEB_KEY")
   @State public var cdate = Date()
   @State public var comp = ""
    @State public var test = ""
   @State public var amount: String = UserDefaults.standard.string(forKey: "AM_KEY") ?? ""
   @State public var navi = true
   @FocusState private var focusedField: FocusedField?
    

    var body: some View {
        
        ZStack{
            Color.background.ignoresSafeArea()
            Form{
                Section(header: Text("Details")){
                    Toggle("Is this an expense?", isOn: $expe)
                        .toggleStyle(SwitchToggleStyle())
                    TextField("£££", text: $amount)
                        .focused($focusedField, equals: .dec)
                        .numbersOnly($amount, includeDecimal: true)
                    TextField("Company", text: $comp)
                    DatePicker("Date", selection: $cdate, displayedComponents: .date)
                        .foregroundColor(Color.text)
                    Picker("Category", selection:$test){
                        Text("Software")
                        Text("Transport")
                    }
                    //.pickerStyle(.menu)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.background)
            .navigationTitle("New Transaction")
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Spacer()
                }
                ToolbarItem(placement: .keyboard) {
                    Button {
                        focusedField = nil
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down.fill")
                            .foregroundColor(Color.icon)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save"){
                        print("Test")
                    }
                    .buttonStyle(GButton())
                }
            }
            .navigationTitle("New Transaction")
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .background(Color.background)
            .foregroundColor(Color.text)
        }
    }
}

struct inputView_Previews: PreviewProvider {
    static var previews: some View {
        inputView()
    }
}
