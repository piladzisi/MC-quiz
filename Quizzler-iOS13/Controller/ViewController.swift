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
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        restartButton.isHidden = true
        progressBar.progress = 0
        
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        updateUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.backgroundColor = UIColor.clear
        }
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        if !quizBrain.endOfQuiz {
            questionLabel.text = quizBrain.getQuestionText()
            progressBar.progress = quizBrain.getProgress()
            
            
        } else {
            questionLabel.text = "End of Quiz"
            progressBar.progress = quizBrain.calculateProgress()
            progressBar.progressTintColor = UIColor.green
            trueButton.isHidden  = true
            falseButton.isHidden = true
            restartButton.isHidden = false
            
        }
        
    }
    @IBAction func restartButtonClicked(_ sender: Any) {
        quizBrain.restartQuiz()
        
        trueButton.isHidden  = false
        falseButton.isHidden = false
        restartButton.isHidden = true
        progressBar.progressTintColor = UIColor(red:1.00, green:0.46, blue:0.66, alpha:1.0)
        updateUI()
        
    }
}

