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



enum categor: String, Identifiable, CaseIterable {
    
    var id: UUID {
        return UUID()
    }
    
    case transport = "Transport"
    case software = "Software"
    case food = "food"
    case leisure = "leisure"
    case health = "health"
    case work = "work"
}

extension categor {
    
    var title: String {
        switch self {
        case .transport:
            return "Transport"
        case .software:
            return "Software"
        case .food:
            return "Food"
        case .leisure:
            return "Leisure"
        case .health:
            return "Health"
        case .work:
            return "Work"
        }
    }
}

struct inputView: View {
    
    @Environment(\.managedObjectContext) var mox
    @Environment(\.dismiss) var dismiss
    
    enum FocusedField{
           case dec
       }
    enum test: Hashable, CaseIterable{
        case a
        case b
    }
    
    private func saveTask(){
        do{
            CoreDataManager().addtran(name: comp, isexp: expe, date: cdate, categoryy: mercha, amounte: amount, context: mox)
            dismiss()
        }
    }
    
    @State private var path = NavigationPath()
    @State public var expe: Bool = UserDefaults.standard.bool(forKey: "DEB_KEY")
    @State public var cdate = Date()
    @State public var comp = ""
    @Environment(\.managedObjectContext) private var viewContext
    @State public var mercha: categor = .transport
    @State public var amount: String = UserDefaults.standard.string(forKey: "AM_KEY") ?? ""
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
                    Picker("Category", selection:$mercha){
                        ForEach(categor.allCases){ categor in
                            Text(categor.title).tag(categor)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section{
                    HStack{
                        Spacer()
                        Button("Save"){
                            saveTask()
                        }
                        Spacer()
                    }
                }
                
                Section{
                    HStack{
                        Spacer()
                        Button("Cancel"){
                            dismiss()
                        }
                        Spacer()
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.background)
            .navigationTitle("New Transaction")
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
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
