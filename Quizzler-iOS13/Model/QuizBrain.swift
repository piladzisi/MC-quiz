//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Old Mac on 11/11/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quizArray = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    var questionNumber = 0
    var endOfQuiz = false
    var score = 0
    
    
    mutating func  checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quizArray[questionNumber].correctAnswer{
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quizArray[questionNumber].question
    }
    
   func getAnswers() -> [String] {
           return quizArray[questionNumber].answers
       }
    
    func getProgress() -> Float {
        return Float(questionNumber+1) / Float(quizArray.count)
    }
    
    mutating func nextQuestion () {
        if questionNumber < quizArray.count - 1 {
            questionNumber+=1
        } else {
            endOfQuiz = true
        }
     }
    mutating func restartQuiz () {
        questionNumber = 0
        score = 0
        endOfQuiz = false
    }
    mutating func getScore() -> Int {
       return score
    }
    
    func calculateProgress() -> Float {
        return Float(score) / Float(quizArray.count)
    }
}
