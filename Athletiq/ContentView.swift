//
//  ContentView.swift
//  Athletiq
//
//  Created by 64005540 on 4/7/26.
//



import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                
                // Header
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .frame(width: 334, height: 65)
                    
                    Text("Welcome to Athletiq")
                        .font(.custom("Inter", size: 36))
                        .foregroundColor(.black)
                }
                .padding(.top, 50)
                
                // Start Quiz (we’ll connect later)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .frame(width: 180, height: 60)
                    
                    Text("Start Quiz")
                        .font(.custom("Inter", size: 24))
                        .foregroundColor(.black)
                }
                
                // Options Grid
                HStack(spacing: 20) {
                    
                    VStack(spacing: 20) {
                        
                        //  LEADERBOARD
                        NavigationLink(destination: LeaderboardView()) {
                            OptionCard(
                                title: "Leaderboard",
                                subtitle: "See Top Players --->"
                            )
                        }
                        
                        // Profile (we’ll build next)
                        NavigationLink(destination: ProfileView()) {
                            OptionCard(
                                title: "Profile",
                                subtitle: "View & edit your profile --->"
                            )
                        }
                    }
                    
                    VStack(spacing: 20) {
                        
                        // Shop (leave for now)
                        NavigationLink(destination: ShopView()) {
                            OptionCard(
                                title: "Shop",
                                subtitle: "Buy rewards --->"
                            )
                        }
                        
                        
                        // Settings
                        NavigationLink(destination: SettingsView()) {
                            OptionCard(
                                title: "Settings",
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
                
                // Bottom Navigation (visual only for now)
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
                .font(.custom("Inter", size: 24))
                .foregroundColor(.black)
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }


// Reusable card
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

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
