//
//  QuestionsBank.swift
//  Quizzler-iOS13
//
//  Created by Old Mac on 11/10/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        question = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}

