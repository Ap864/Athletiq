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
    
    @State private var timeRemaining = 20
    @State private var timer: Timer?
    
    @State private var quizQuestions: [Question] = []
    
    @State private var selectedAnswer: Int? = nil
    @State private var showFeedback = false
    
    //  GLOBAL STORAGE
    @AppStorage("coins") var coins = 0
    @AppStorage("hasExtraTime") var hasExtraTime = false
    @AppStorage("hasDoubleCoins") var hasDoubleCoins = false
    @AppStorage("hasFiftyFifty") var hasFiftyFifty = false
    @AppStorage("nameColor") var nameColor = "black"
    @AppStorage("username") var username = "Player"
    
    //  ADDED (language)
    @AppStorage("appLanguage") var appLanguage = "en"
    
    @State private var coinsEarned = 0
    
    //  POWERUPS
    @State private var extraTimeUses = 3
    @State private var usedFiftyFifty = false
    @State private var hiddenAnswers: Set<Int> = []
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                Text(username)
                    .foregroundColor(getNameColor())
                
                Spacer()
                
                Text("🪙 \(coins)")
            }
            .padding(.horizontal)
            
            if showScore {
                //  CHANGED
                Text("\(localized("final_score", language: appLanguage)): \(score)/\(quizQuestions.count)")
                    .font(.largeTitle)
                
                //  CHANGED
                Text("\(localized("coins_earned", language: appLanguage)): \(coinsEarned)")
                
                Text("Total Coins: \(coins)")
                
            } else if !quizQuestions.isEmpty {
                
                let question = quizQuestions[currentQuestionIndex]
                
                //  CHANGED
                Text("\(localized("time", language: appLanguage)): \(timeRemaining)")
                
                if hasExtraTime && extraTimeUses > 0 {
                    Button("+5 Seconds (\(extraTimeUses))") {
                        timeRemaining += 5
                        extraTimeUses -= 1
                    }
                }
                
                if hasFiftyFifty && !usedFiftyFifty {
                    Button("50/50") {
                        useFiftyFifty(correctIndex: question.correctAnswer)
                    }
                }
                
                Text(question.question)
                    .padding()
                
                ForEach(0..<question.options.count, id: \.self) { index in
                    if !hiddenAnswers.contains(index) {
                        Button(action: {
                            checkAnswer(selected: index)
                        }) {
                            Text(question.options[index])
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(getColor(index: index, correct: question.correctAnswer))
                                .cornerRadius(10)
                        }
                        .disabled(showFeedback)
                    }
                }
            }
        }
        .padding()
        .onAppear {
            setupQuiz()
            startTimer()
            
            extraTimeUses = 3
            usedFiftyFifty = false
            hiddenAnswers.removeAll()
        }
        .onChange(of: currentQuestionIndex) { _ in
            startTimer()
            hiddenAnswers.removeAll()
        }
    }
    
    func useFiftyFifty(correctIndex: Int) {
        var wrongIndexes = [0,1,2,3].filter { $0 != correctIndex }
        wrongIndexes.shuffle()
        
        hiddenAnswers = Set(wrongIndexes.prefix(2))
        
        usedFiftyFifty = true
        hasFiftyFifty = false
    }
    
    func getNameColor() -> Color {
        switch nameColor {
        case "red": return .red
        case "blue": return .blue
        default: return .black
        }
    }
    
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
    
    func setupQuiz() {
        let filtered = allQuestions.filter {
            $0.difficulty == selectedDifficulty
        }
        quizQuestions = Array(filtered.shuffled().prefix(numberOfQuestions))
    }
    
    func startTimer() {
        timer?.invalidate()
        
        switch selectedDifficulty {
        case "Easy": timeRemaining = 20
        case "Medium": timeRemaining = 16
        case "Hard": timeRemaining = 12
        default: timeRemaining = 20
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
    
    func awardCoins() {
        let percentage = Double(score) / Double(quizQuestions.count)
        
        coinsEarned = 0
        
        guard quizQuestions.count >= 10 else { return }
        guard percentage >= 0.8 else { return }
        
        switch selectedDifficulty {
        case "Easy": coinsEarned = 50
        case "Medium": coinsEarned = 75
        case "Hard": coinsEarned = 100
        default: break
        }
        
        if hasDoubleCoins {
            coinsEarned *= 2
        }
        
        coins += coinsEarned
        
        if hasDoubleCoins {
            hasDoubleCoins = false
        }
    }
    
    func checkAnswer(selected: Int) {
        timer?.invalidate()
        
        let question = quizQuestions[currentQuestionIndex]
        
        selectedAnswer = selected
        showFeedback = true
        
        if selected == question.correctAnswer {
            score += 1
        }
        
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
            awardCoins()
            showScore = true
        }
    }
}
