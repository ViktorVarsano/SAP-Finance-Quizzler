//
//  ViewController.swift
//  SAP Finance Quizzler
//
//  Created by Viktor Varsano on 5.12.20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

     @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // True, False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
         
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
        progressBar.progress = quizBrain.getProgress()  

        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
     

}

