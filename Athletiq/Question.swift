//
//  Question.swift
//  Athletiq
//
//  Created by 64005540 on 4/16/26.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
    let correctAnswer: Int
}
