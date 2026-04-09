//
//  ProfileView.swift
//  Athletiq
//
//  Created by 64005540 on 4/9/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile")
                .font(.custom("Inter", size: 36))
                .padding(.top, 30)
            
            Text("Your stats and info will show here")
                .font(.custom("Inter", size: 18))
                .padding()
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}
