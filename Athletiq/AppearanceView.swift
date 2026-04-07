//
//  AppearanceView.swift
//  Athletiq
//
//  Created by 64005540 on 4/16/26.
//

import SwiftUI

struct AppearanceView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Appearance")
                .font(.largeTitle)
            
            Toggle("Dark Mode", isOn: $isDarkMode)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}
