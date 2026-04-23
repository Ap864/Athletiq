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
    
    //  ADDED (language)
    @AppStorage("appLanguage") var appLanguage = "en"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                
                Text(localized("start_quiz", language: appLanguage)) // 🔥 CHANGED
                    .font(.custom("Inter", size: 40))
                    .padding(.top, 40)
                
                // Difficulty Picker
                VStack {
                    Text(localized("select_difficulty", language: appLanguage)) // 🔥 CHANGED
                        .font(.custom("Inter", size: 24))
                    
                    Picker("Difficulty", selection: $selectedDifficulty) {
                        Text(localized("easy", language: appLanguage)).tag("Easy")     // 🔥
                        Text(localized("medium", language: appLanguage)).tag("Medium") // 🔥
                        Text(localized("hard", language: appLanguage)).tag("Hard")     // 🔥
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
                
                // Slider
                VStack {
                    Text("\(localized("num_questions", language: appLanguage)): \(Int(numberOfQuestions))") // 🔥
                        .font(.custom("Inter", size: 20))
                    
                    Slider(value: $numberOfQuestions, in: 1...82, step: 1)
                        .padding()
                }
                
                // START BUTTON
                NavigationLink(
                    destination: QuizView(
                        selectedDifficulty: selectedDifficulty,
                        numberOfQuestions: Int(numberOfQuestions)
                    )
                ) {
                    Text(localized("start", language: appLanguage)) // 🔥 CHANGED
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


