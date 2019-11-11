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
    
    
    var score = 0
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        progressBar.progress = 0
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        quizBrain.checkAnswer(userAnswer)
        
        if userAnswer == quizBrain.quizArray[questionNumber].answer {
            score+=1
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.backgroundColor = UIColor.clear
        }
        
        if questionNumber < quizBrain.quizArray.count - 1 {
            questionNumber+=1
            updateUI()
        } else {
            questionLabel.text = "End of the quiz"
        }
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.quizArray[questionNumber].question
        let progressOfTheQuiz = Float(questionNumber+1) / Float(quizBrain.quizArray.count)
        progressBar.setProgress(progressOfTheQuiz, animated: true)
    }
}

