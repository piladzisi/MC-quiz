//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
    
    let quizArray = [
        ["Which is the largest organ in the human body?", "True"],
        ["It is illegal to pee in the Ocean in Portugal.", "False"],
        ["Which is the largest organ in the human body?", "True"],
        
    ]
    
    var questionNumber = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let progressOfTheQuiz = Float(questionNumber+1) / Float(quizArray.count)
        progressBar.setProgress(progressOfTheQuiz, animated: true)
       
        if userAnswer == quizArray[questionNumber][1]{
            score+=1
            print(score)
        } else {
            print("Wrong")
        }
        
        if questionNumber < quizArray.count - 1 {
            questionNumber+=1
            updateUI()
        } else {
            questionLabel.text = "End of the quiz"
            
        }
    }
    
    func updateUI() {
        questionLabel.text = quizArray[questionNumber][0]
    
    }
}

