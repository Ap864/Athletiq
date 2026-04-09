//
//  TutorialView.swift
//  Athletiq
//
//  Created by 64005540 on 4/9/26.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        VStack {
            Text("Tutorial")
                .font(.custom("Inter", size: 36))
                .padding(.top, 30)
            
            Text("Instructions for how to play will go here")
                .font(.custom("Inter", size: 18))
                .padding()
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}
