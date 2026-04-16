//
//  SettingsView.swift
//  Athletiq
//
//  Created by 64005540 on 4/9/26.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    
                    // Title
                    Text("Settings")
                        .font(.custom("Inter", size: 40))
                        .foregroundColor(Color(red: 0.50, green: 0.23, blue: 0.27))
                        .padding(.top, 20)
                    
                    // MARK: - Account Section
                    Text("Account Settings")
                        .font(.custom("Inter", size: 22).weight(.bold))
                    
                    VStack(spacing: 15) {
                        
                        // Profile
                        NavigationLink(destination: ProfileView()) {
                            SettingsRow(title: "Profile and Accounts")
                        }
                        
                        //  About / Help (ADDED)
                        NavigationLink(destination: AboutView()) {
                            SettingsRow(title: "About / Help")
                        }
                    }
                    
                    // MARK: - Personalization Section
                    Text("Personalization")
                        .font(.custom("Inter", size: 22).weight(.bold))
                    
                    VStack(spacing: 15) {
                        
                        // 🌙 Dark Mode Toggle
                        HStack {
                            Text("Dark Mode")
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Toggle("", isOn: $isDarkMode)
                                .labelsHidden()
                        }
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        
                        // 🌍 Language
                        NavigationLink(destination: LanguageView()) {
                            SettingsRow(title: "Language")
                        }
                        
                        // 🎨 Appearance
                        NavigationLink(destination: AppearanceView()) {
                            SettingsRow(title: "Appearance")
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .background(Color(red: 0.38, green: 0.41, blue: 0.40))
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        //  DARK MODE APPLIED HERE
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

//  Reusable Row
struct SettingsRow: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
            
            Spacer()
            
            Text(">")
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.gray.opacity(0.3))
        .cornerRadius(10)
    }
}
