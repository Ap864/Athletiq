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
    
    // TIMER
    @State private var timeRemaining = 20
    @State private var timer: Timer?
    
    // LOCKED QUESTIONS
    @State private var quizQuestions: [Question] = []
    
    //  NEW (FEEDBACK)
    @State private var selectedAnswer: Int? = nil
    @State private var showFeedback = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            if showScore {
                Text("Final Score: \(score)/\(quizQuestions.count)")
                    .font(.largeTitle)
            } else if !quizQuestions.isEmpty {
                
                let question = quizQuestions[currentQuestionIndex]
                
                Text("Time: \(timeRemaining)")
                    .font(.headline)
                
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
                            .background(getColor(index: index, correct: question.correctAnswer))
                            .cornerRadius(10)
                    }
                    .disabled(showFeedback) //  prevent spam clicks
                }
            }
        }
        .padding()
        .onAppear {
            setupQuiz()
            startTimer()
        }
        .onChange(of: currentQuestionIndex) { _ in
            startTimer()
        }
    }
    
    //  COLOR LOGIC
    func getColor(index: Int, correct: Int) -> Color {
        if showFeedback {
            if index == correct {
                return Color.green
            } else if index == selectedAnswer {
                return Color.red
            }
        }
        return Color.gray.opacity(0.2)
    }
    
    // SET QUESTIONS
    func setupQuiz() {
        let filtered = allQuestions.filter {
            $0.difficulty == selectedDifficulty
        }
        quizQuestions = Array(filtered.shuffled().prefix(numberOfQuestions))
    }
    
    // TIMER
    func startTimer() {
        timer?.invalidate()
        
        switch selectedDifficulty {
        case "Easy":
            timeRemaining = 20
        case "Medium":
            timeRemaining = 16
        case "Hard":
            timeRemaining = 12
        default:
            timeRemaining = 20
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
                nextQuestion()
            }
        }
    }
    
    //  UPDATED ANSWER FUNCTION
    func checkAnswer(selected: Int) {
        timer?.invalidate()
        
        let question = quizQuestions[currentQuestionIndex]
        
        selectedAnswer = selected
        showFeedback = true
        
        if selected == question.correctAnswer {
            score += 1
        }
        
        // wait 1 second before moving on
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            nextQuestion()
        }
    }
    
    func nextQuestion() {
        selectedAnswer = nil
        showFeedback = false
        
        if currentQuestionIndex + 1 < quizQuestions.count {
            currentQuestionIndex += 1
        } else {
            showScore = true
        }
    }
}
