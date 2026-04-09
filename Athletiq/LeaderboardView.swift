//
//  LeaderboardView.swift
//  Athletiq
//
//  Created by 64005540 on 4/9/26.
//

import SwiftUI

struct LeaderboardView: View {
    
    // 10 players with realistic scores
    let players = (1...10).map { i in
        (name: "Player\(i)", score: Int.random(in: 500...1500))
    }
    .sorted { $0.score > $1.score }
    
    var body: some View {
        VStack {
            
            // Title
            Text("Leaderboard")
                .font(.custom("Inter", size: 36))
                .padding(.top, 20)
            
            // Tabs (Top / My Rank)
            HStack {
                Text("Top")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(8)
                
                Text("My Rank")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            // Leaderboard List
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(players.indices, id: \.self) { index in
                        let player = players[index]
                        
                        HStack {
                            Text("#\(index + 1)")
                                .frame(width: 40, alignment: .leading)
                            
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
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}
