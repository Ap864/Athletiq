//
//  TutorialView.swift
//  Athletiq
//
//  Created by 64005540 on 4/9/26.
//

import SwiftUI
import AVKit

struct TutorialView: View {
    
    @State private var showVideo = false
    
    var body: some View {
        VStack {
            
            // Title
            Text("Tutorial")
                .font(.custom("Inter", size: 40))
                .padding(.top, 40)
            
            Spacer()
            
            // Play Button
            Button(action: {
                showVideo = true
            }) {
                ZStack {
                    Circle()
                        .fill(Color(red: 0.5, green: 0.23, blue: 0.27))
                        .frame(width: 120, height: 120)
                    
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                }
            }
            
            Text("Watch how to use the app")
                .font(.custom("Inter", size: 18))
                .padding(.top, 10)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.82, green: 0.82, blue: 0.82))
        .sheet(isPresented: $showVideo) {
            
            //  VIDEO PLAYER
            VideoPlayer(player: AVPlayer(
                url: URL(string: "https://www.w3schools.com/html/mov_bbb.mp4")!
            ))
            .ignoresSafeArea()
        }
    }
}
