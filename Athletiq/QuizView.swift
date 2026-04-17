//
//  QuizView.swift
//  Athletiq
//
//  Created by 64005540 on 4/16/26.
//

import SwiftUI

struct QuizView: View {
    
    var selectedDifficulty: String
    var numberOfQuestions: Int
    
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showScore = false
    
    // 🔥 FILTER + RANDOMIZE (THIS IS THE IMPORTANT PART)
    var quizQuestions: [Question] {
        let filtered = allQuestions.filter {
            $0.difficulty == selectedDifficulty
        }
        return Array(filtered.shuffled().prefix(numberOfQuestions))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            if showScore {
                Text("Final Score: \(score)/\(quizQuestions.count)")
                    .font(.largeTitle)
            } else {
                
                let question = quizQuestions[currentQuestionIndex]
                
                Text(question.question)
                    .font(.title2)
                    .padding()
                
                ForEach(0..<question.options.count, id: \.self) { index in
                    Button(action: {
                        checkAnswer(selected: index)
                    }) {
                        Text(question.options[index])
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding()
    }
    
    func checkAnswer(selected: Int) {
        let question = quizQuestions[currentQuestionIndex]
        
        if selected == question.correctAnswer {
            score += 1
        }
        
        if currentQuestionIndex + 1 < quizQuestions.count {
            currentQuestionIndex += 1
        } else {
            showScore = true
        }
    }
}
