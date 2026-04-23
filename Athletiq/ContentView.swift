//
//  ContentView.swift
//  Athletiq
//
//  Created by 64005540 on 4/7/26.
//


import SwiftUI

struct ContentView: View {
    
    @AppStorage("coins") var coins = 0
    @AppStorage("nameColor") var nameColor = "black"
    @AppStorage("username") var username = "Player"
    @AppStorage("appLanguage") var appLanguage = "en"
    
    var body: some View {
        
        TabView {
            
            // 🏠 HOME TAB
            NavigationStack {
                ZStack {
                    
                    LinearGradient(
                        colors: [Color.blue.opacity(0.2), Color.white],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                    
                    VStack(spacing: 25) {
                        
                        // Top Bar
                        HStack {
                            Text(username)
                                .foregroundColor(getNameColor())
                                .font(.title3.bold())
                            
                            Spacer()
                            
                            HStack(spacing: 6) {
                                Text("🪙")
                                Text("\(coins)")
                            }
                            .font(.headline)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(.ultraThinMaterial)
                            .cornerRadius(12)
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        // Header
                        Text(localized("welcome", language: appLanguage))
                            .font(.system(size: 38, weight: .bold))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.blue, .purple],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        
                        // Start Quiz
                        NavigationLink(destination: StartQuizView()) {
                            Text(localized("start_quiz", language: appLanguage))
                                .font(.title2.bold())
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }
                        .padding(.horizontal)
                        
                        // Grid
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 20) {
                            
                            NavigationLink(destination: LeaderboardView()) {
                                ModernCard(
                                    title: localized("leaderboard", language: appLanguage),
                                    subtitle: localized("see_top_players", language: appLanguage),
                                    icon: "trophy.fill"
                                )
                            }
                            
                            NavigationLink(destination: ProfileView()) {
                                ModernCard(
                                    title: localized("profile", language: appLanguage),
                                    subtitle: localized("edit_profile", language: appLanguage),
                                    icon: "person.fill"
                                )
                            }
                            
                            NavigationLink(destination: ShopView()) {
                                ModernCard(
                                    title: localized("shop", language: appLanguage),
                                    subtitle: localized("buy_rewards", language: appLanguage),
                                    icon: "cart.fill"
                                )
                            }
                            
                            NavigationLink(destination: SettingsView()) {
                                ModernCard(
                                    title: localized("settings", language: appLanguage),
                                    subtitle: localized("preferences", language: appLanguage),
                                    icon: "gearshape.fill"
                                )
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        // Tutorial
                        NavigationLink(destination: TutorialView()) {
                            Text(localized("tutorial", language: appLanguage))
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(12)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text(localized("home", language: appLanguage))
            }
            
            
            // 👤 PROFILE TAB
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text(localized("profile", language: appLanguage))
            }
            
            
            // 🛒 SHOP TAB
            NavigationStack {
                ShopView()
            }
            .tabItem {
                Image(systemName: "cart.fill")
                Text(localized("shop", language: appLanguage))
            }
            
            
            // ⚙️ SETTINGS TAB
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text(localized("settings", language: appLanguage))
            }
        }
    }
    
    
    func getNameColor() -> Color {
        switch nameColor {
        case "red": return .red
        case "blue": return .blue
        default: return .black
        }
    }
}


// Card (UNCHANGED)
struct ModernCard: View {
    var title: String
    var subtitle: String
    var icon: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(.blue)
            
            Text(title)
                .font(.headline)
            
            Text(subtitle)
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, minHeight: 130)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
    }
}


#Preview {
    ContentView()
}
