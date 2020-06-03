//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quizBrain = QuizBrain()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var aPressed: UIButton!
    @IBOutlet weak var bPressed: UIButton!
    @IBOutlet weak var cPressed: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        aPressed.layer.cornerRadius = 15
        bPressed.layer.cornerRadius = 15
        cPressed.layer.cornerRadius = 15
        
    }

    
    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let isHeCorrect = quizBrain.isCorrect(userAnswer: userAnswer)
        
        if isHeCorrect == true {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.advanceQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    
   @objc func updateUI() {
        
        let answerChoices = quizBrain.getAnswers()
        
        aPressed.setTitle(answerChoices[0], for: .normal)
        bPressed.setTitle(answerChoices[1], for: .normal)
        cPressed.setTitle(answerChoices[2], for: .normal)
        
        questionLabel.text = quizBrain.getQuestionText()
    
    aPressed.backgroundColor = UIColor.systemIndigo
    bPressed.backgroundColor = UIColor.systemIndigo
    cPressed.backgroundColor = UIColor.systemIndigo
    progressBar.progress = quizBrain.getProgress()
    scoreLabel.text = "Score: \(quizBrain.getScore())"
    
        
    }
   
    
    
    
    
}

