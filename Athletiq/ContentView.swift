//
//  ContentView.swift
//  Athletiq
//
//  Created by 64005540 on 4/7/26.
//


import SwiftUI

struct ContentView: View {
    
    //  ADDED
    @AppStorage("coins") var coins = 0
    @AppStorage("nameColor") var nameColor = "black"
    @AppStorage("username") var username = "Player"
    
    //  ADDED (language)
    @AppStorage("appLanguage") var appLanguage = "en"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                
                //  ADDED TOP BAR
                HStack {
                    Text(username)
                        .foregroundColor(getNameColor())
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("🪙 \(coins)")
                        .font(.custom("Inter", size: 20))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.yellow.opacity(0.3))
                        .cornerRadius(10)
                        .padding(.trailing, 20)
                }
                
                // Header
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .frame(width: 334, height: 65)
                    
                    //  CHANGED
                    Text(localized("welcome", language: appLanguage))
                        .font(.custom("Inter", size: 36))
                        .foregroundColor(.black)
                }
                .padding(.top, 50)
                
                // Start Quiz
                NavigationLink(destination: StartQuizView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 180, height: 60)
                        
                        //  CHANGED
                        Text(localized("start_quiz", language: appLanguage))
                            .font(.custom("Inter", size: 24))
                            .foregroundColor(.black)
                    }
                }
                
                // Options Grid
                HStack(spacing: 20) {
                    
                    VStack(spacing: 20) {
                        
                        NavigationLink(destination: LeaderboardView()) {
                            OptionCard(
                                title: localized("leaderboard", language: appLanguage), //
                                subtitle: "See Top Players --->"
                            )
                        }
                        
                        NavigationLink(destination: ProfileView()) {
                            OptionCard(
                                title: localized("profile", language: appLanguage), //
                                subtitle: "View & edit your profile --->"
                            )
                        }
                    }
                    
                    VStack(spacing: 20) {
                        
                        NavigationLink(destination: ShopView()) {
                            OptionCard(
                                title: localized("shop", language: appLanguage), //
                                subtitle: "Buy rewards --->"
                            )
                        }
                        
                        NavigationLink(destination: SettingsView()) {
                            OptionCard(
                                title: localized("settings", language: appLanguage), //
                                subtitle: "Preferences & more --->"
                            )
                        }
                    }
                }
                .padding(.top, 30)
                
                Spacer()
                
                // Tutorial button
                NavigationLink(destination: TutorialView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(height: 40)
                        
                        Text("? Tutorial")
                            .font(.custom("Inter", size: 24))
                            .foregroundColor(.black)
                    }
                }
                
                // Bottom Navigation
                HStack(spacing: 30) {
                    NavigationLink(destination: ContentView()) {
                        Text("Home")
                    }
                    
                    NavigationLink(destination: ProfileView()) {
                        Text("Profile")
                    }
                    
                    NavigationLink(destination: ShopView()) {
                        Text("Shop")
                    }
                    
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                    }
                }
                .font(.custom("Inter", size: 24))
                .foregroundColor(.black)
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
    
    //  ADDED
    func getNameColor() -> Color {
        switch nameColor {
        case "red": return .red
        case "blue": return .blue
        default: return .black
        }
    }
}


// Reusable card (UNCHANGED)
struct OptionCard: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                .frame(width: 170, height: 110)
            
            VStack(spacing: 8) {
                Text(title)
                    .font(.custom("Inter", size: 24))
                    .foregroundColor(.black)
                
                Text(subtitle)
                    .font(.custom("Inter", size: 15))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding(.horizontal, 5)
            }
            .padding()
        }
    }
}
#Preview {
    ContentView()
}
