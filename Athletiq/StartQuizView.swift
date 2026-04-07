//
//  StartQuizView.swift
//  Athletiq
//
//  Created by Jonathan Fernando on 4/22/26.
//
//
//  StartQuizView.swift
//  Athletiq
//
//  Created by 64005540 on 4/16/26.
//

import SwiftUI

struct StartQuizView: View {
    
    @State private var selectedDifficulty = "Easy"
    @State private var numberOfQuestions: Double = 10
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                
                Text("Start Quiz")
                    .font(.custom("Inter", size: 40))
                    .padding(.top, 40)
                
                // Difficulty Picker
                VStack {
                    Text("Select Difficulty")
                        .font(.custom("Inter", size: 24))
                    
                    Picker("Difficulty", selection: $selectedDifficulty) {
                        Text("Easy").tag("Easy")
                        Text("Medium").tag("Medium")
                        Text("Hard").tag("Hard")
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
                
                // Slider
                VStack {
                    Text("Number of Questions: \(Int(numberOfQuestions))")
                        .font(.custom("Inter", size: 20))
                    
                    Slider(value: $numberOfQuestions, in: 1...82, step: 1)
                        .padding()
                }
                
                // START BUTTON (CONNECTED)
                NavigationLink(
                    destination: QuizView(
                        selectedDifficulty: selectedDifficulty,
                        numberOfQuestions: Int(numberOfQuestions)
                    )
                ) {
                    Text("Start")
                        .font(.custom("Inter", size: 24))
                        .padding()
                        .frame(width: 200)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}
