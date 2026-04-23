//
//  SettingsView.swift
//  Athletiq
//
//  Created by 64005540 on 4/9/26.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    //  ADDED (language)
    @AppStorage("appLanguage") var appLanguage = "en"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    
                    // Title
                    Text(localized("settings", language: appLanguage)) // 🔥 CHANGED
                        .font(.custom("Inter", size: 40))
                        .foregroundColor(Color(red: 0.50, green: 0.23, blue: 0.27))
                        .padding(.top, 20)
                    
                    // MARK: - Account Section
                    Text(localized("account_settings", language: appLanguage)) // 🔥 CHANGED
                        .font(.custom("Inter", size: 22).weight(.bold))
                    
                    VStack(spacing: 15) {
                        
                        // Profile
                        NavigationLink(destination: ProfileView()) {
                            SettingsRow(title: localized("profile_accounts", language: appLanguage)) // 🔥
                        }
                        
                        //  About / Help
                        NavigationLink(destination: AboutView()) {
                            SettingsRow(title: localized("about_help", language: appLanguage)) // 🔥
                        }
                    }
                    
                    // MARK: - Personalization Section
                    Text(localized("personalization", language: appLanguage)) //  CHANGED
                        .font(.custom("Inter", size: 22).weight(.bold))
                    
                    VStack(spacing: 15) {
                        
                        // 🌙 Dark Mode Toggle
                        HStack {
                            Text(localized("dark_mode", language: appLanguage)) //  CHANGED
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
                            SettingsRow(title: localized("language", language: appLanguage)) //
                        }
                        
                        // 🎨 Appearance
                        NavigationLink(destination: AppearanceView()) {
                            SettingsRow(title: localized("appearance", language: appLanguage)) // 
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
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

//  Reusable Row (UNCHANGED)
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
