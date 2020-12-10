//
//  ViewController.swift
//  SAP Finance Quizzler
//
//  Created by Viktor Varsano on 5.12.20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!

    var quizBrain = QuizBrain()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

     @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
         
        if userGotItRight  {
            sender.backgroundColor = UIColor.green
             
        } else {
            sender.backgroundColor = UIColor.red

        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false )
        
    }
        
    @objc func updateUI()  {
        questionLabel.text = quizBrain.getQuestionText()
        
        //Need to fetch the answers and update the button titles using the setTitle method
        let answerChoices = quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        choice4.setTitle(answerChoices[3], for: .normal)
        
        choice1.titleLabel?.adjustsFontSizeToFitWidth = true
        choice1.titleLabel?.minimumScaleFactor = 0.20
        choice1.titleLabel?.numberOfLines = 0

        choice2.titleLabel?.adjustsFontSizeToFitWidth = true
        choice2.titleLabel?.minimumScaleFactor = 0.20
        choice2.titleLabel?.numberOfLines = 0

        choice3.titleLabel?.adjustsFontSizeToFitWidth = true
        choice3.titleLabel?.minimumScaleFactor = 0.20
        choice3.titleLabel?.numberOfLines = 0

        choice4.titleLabel?.adjustsFontSizeToFitWidth = true
        choice4.titleLabel?.minimumScaleFactor = 0.20
        choice4.titleLabel?.numberOfLines = 0
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        choice4.backgroundColor = UIColor.clear
        
    }

}
