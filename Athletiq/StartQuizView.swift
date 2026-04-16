//
//  StartQuizView.swift
//  Athletiq
//
//  Created by 64005540 on 4/16/26.
//

import SwiftUI

struct StartQuizView: View {
    
    @State private var selectedDifficulty = "Easy"
    @State private var questionCount = 10
    
    let difficulties = ["Easy", "Medium", "Hard"]
    
    var body: some View {
        VStack(spacing: 30) {
            
            // Title
            Text("Start Quiz")
                .font(.custom("Inter", size: 40))
                .padding(.top, 40)
            
            // Difficulty Section
            Text("Select Difficulty")
                .font(.headline)
            
            HStack(spacing: 20) {
                ForEach(difficulties, id: \.self) { diff in
                    Button(action: {
                        selectedDifficulty = diff
                    }) {
                        Text(diff)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedDifficulty == diff ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
            
            //  Question Slider Section
            Text("Number of Questions: \(questionCount)")
                .font(.headline)
            
            Slider(
                value: Binding(
                    get: { Double(questionCount) },
                    set: { questionCount = Int($0) }
                ),
                in: 1...82,
                step: 1
            )
            .padding(.horizontal)
            
            // Min / Max labels
            HStack {
                Text("1")
                Spacer()
                Text("82")
            }
            .padding(.horizontal)
            .font(.caption)
            
            Spacer()
            
            // Start Button
            NavigationLink(destination: QuizView()) {
                Text("Start")
                    .font(.custom("Inter", size: 24))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.50, green: 0.23, blue: 0.27))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.50, green: 0.56, blue: 0.56).opacity(0.43))
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}


