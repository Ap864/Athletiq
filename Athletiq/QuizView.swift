//
//  QuizView.swift
//  Athletiq
//
//  Created by 64005540 on 4/16/26.
//

import SwiftUI

struct QuizView: View {
    
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showResult = false
    
    var body: some View {
        
        let question = sampleQuestions[currentQuestionIndex]
        
        VStack(spacing: 30) {
            
            // Question Counter
            Text("Question \(currentQuestionIndex + 1)/\(sampleQuestions.count)")
                .font(.headline)
            
            // Question Text
            Text(question.question)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            // Answer Buttons
            ForEach(0..<question.options.count, id: \.self) { index in
                Button(action: {
                    answerTapped(index)
                }) {
                    Text(question.options[index])
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                }
            }
            
            Spacer()
        }
        .padding()
        .alert("Quiz Finished", isPresented: $showResult) {
            Button("OK") {
                resetQuiz()
            }
        } message: {
            Text("Your score: \(score)/\(sampleQuestions.count)")
        }
    }
    
    func answerTapped(_ index: Int) {
        let question = sampleQuestions[currentQuestionIndex]
        
        if index == question.correctAnswer {
            score += 1
        }
        
        if currentQuestionIndex + 1 < sampleQuestions.count {
            currentQuestionIndex += 1
        } else {
            showResult = true
        }
    }
    
    func resetQuiz() {
        currentQuestionIndex = 0
        score = 0
    }
}
