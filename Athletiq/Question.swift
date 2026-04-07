//
//  Question.swift
//  Athletiq
//
//  Created by Jonathan Fernando on 4/22/26.
//
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
    let category: String
    let difficulty: String
}
