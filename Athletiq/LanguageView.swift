//
//  LanguageView.swift
//  Athletiq
//
//  Created by 64005540 on 4/16/26.
//

import SwiftUI

struct LanguageView: View {
    
    @AppStorage("appLanguage") private var selectedLanguage = "en"
    
    let languages = [
        ("English", "en"),
        ("Spanish", "es"),
        ("French", "fr")
    ]
    
    var body: some View {
        List {
            ForEach(languages, id: \.1) { language in
                HStack {
                    Text(language.0)
                    
                    Spacer()
                    
                    if selectedLanguage == language.1 {
                        Text("✓")
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedLanguage = language.1
                }
            }
        }
        .navigationTitle("Language")
    }
}
