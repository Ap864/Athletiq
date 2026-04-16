//
//  AboutView.swift
//  Athletiq
//
//  Created by 64005540 on 4/16/26.
//

import SwiftUI

struct AboutView: View {
    
    @State private var userIssue: String = ""
    @State private var submitted = false
    
    var body: some View {
        VStack(spacing: 25) {
            
            Text("About / Help")
                .font(.custom("Inter", size: 32))
                .padding(.top, 30)
            
            Text("How can we help you?")
                .font(.custom("Inter", size: 22))
            
            // 🔥 Input Box
            TextField("Describe your issue...", text: $userIssue, axis: .vertical)
                .padding()
                .frame(height: 120)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            // Submit Button
            Button(action: {
                submitted = true
                userIssue = ""
            }) {
                Text("Submit")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.50, green: 0.23, blue: 0.27))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            if submitted {
                Text("Thanks! We'll look into it.")
                    .foregroundColor(.green)
            }
            
            // Tutorial Link
            NavigationLink(destination: TutorialView()) {
                Text("Go to Tutorial >")
                    .padding()
            }
            
            Spacer()
        }
        .padding()
        .background(Color(red: 0.86, green: 0.86, blue: 0.86))
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}
