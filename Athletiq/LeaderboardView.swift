//
//  LeaderboardView.swift
//  Athletiq
//
//  Created by 64005540 on 4/9/26.
//

import SwiftUI

// MARK: - Model (will replace this later with real data)
struct Player: Identifiable {
    let id = UUID()
    let name: String
    let score: Int
}

struct LeaderboardView: View {
    
    //  ADDED (language)
    @AppStorage("appLanguage") var appLanguage = "en"
    
    //  Toggle between views
    @State private var showMyRank = false
    
    //  TEMP DATA (REPLACING THIS LATER)
    let players: [Player] = (1...10).map {
        Player(name: "Player\($0)", score: Int.random(in: 500...1500))
    }
    .sorted { $0.score > $1.score }
    
    //  YOUR PLAYER (REPLACE LATER WITH REAL USER DATA)
    let currentUser = Player(name: "You", score: 880)
    
    var body: some View {
        VStack {
            
            // Title
            Text(localized("leaderboard", language: appLanguage)) //  CHANGED
                .font(.custom("Inter", size: 36))
                .padding(.top, 20)
            
            // Toggle Buttons
            HStack {
                
                Button(action: {
                    showMyRank = false
                }) {
                    Text(localized("top", language: appLanguage)) //  CHANGED
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(showMyRank ? Color.gray.opacity(0.3) : Color.gray)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    showMyRank = true
                }) {
                    Text(localized("my_rank", language: appLanguage)) //  CHANGED
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(showMyRank ? Color.gray : Color.gray.opacity(0.3))
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            
            //  CONTENT SWITCH
            if showMyRank {
                
                Spacer()
                
                // YOUR RANK DISPLAY
                VStack(spacing: 20) {
                    
                    Text(localized("your_rank", language: appLanguage)) //  CHANGED
                        .font(.custom("Inter", size: 28))
                    
                    // Calculate rank
                    let rank = (players + [currentUser])
                        .sorted { $0.score > $1.score }
                        .firstIndex { $0.name == currentUser.name } ?? 0
                    
                    Text("#\(rank + 1)")
                        .font(.custom("Inter", size: 50))
                    
                    Text(currentUser.name)
                    
                    //  CHANGED
                    Text("\(localized("score", language: appLanguage)): \(currentUser.score)")
                }
                
                Spacer()
                
            } else {
                
                //  LEADERBOARD LIST
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(players.indices, id: \.self) { index in
                            let player = players[index]
                            
                            HStack {
                                
                                if index == 0 {
                                    Text("🥇")
                                } else if index == 1 {
                                    Text("🥈")
                                } else if index == 2 {
                                    Text("🥉")
                                } else {
                                    Text("#\(index + 1)")
                                }
                                
                                Text(player.name)
                                
                                Spacer()
                                
                                Text("\(player.score)")
                            }
                            .font(.custom("Inter", size: 20))
                            .padding()
                            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                            .cornerRadius(10)
                        }
                    }
                    .padding()
                }
            }
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}
