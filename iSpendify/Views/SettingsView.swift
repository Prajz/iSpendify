//
//  SettingsView.swift
//  iSpendify
//
//  Created by Dev Prajapati on 29/01/2023.
//

import SwiftUI


enum SchemeType: Int, Identifiable, CaseIterable{
    var id: Self { self }
    case system
    case light
    case dark
}

extension SchemeType {
    var title: String {
        switch self{
        case .system:
            return "📱 System"
        case .light:
            return "🔅 Light"
        case .dark:
            return "🌑 Dark"
        }
    }
}

struct SettingsView: View {
    
    @AppStorage("systemThemeVal") private var systemTheme: Int = SchemeType.allCases.first!.rawValue
    
    @Environment(\.colorScheme) private var colorScheme
    
    var selectedScheme: ColorScheme? {
        guard let theme = SchemeType(rawValue: systemTheme) else { return nil }
        switch theme {
        case .light:
            return .light
        case .dark:
            return .dark
        default:
            return nil
        }
    }
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea()
            VStack{
                Picker(selection: $systemTheme){
                    ForEach(SchemeType.allCases) { item in
                        Text(item.title)
                            .tag(item.rawValue)
                    }
                } label: {
                    Text("Pick a theme")
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(selectedScheme)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
