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
    
    let quiz = [
        ["Two plus two equals four", "True"],
        ["Three plus three equals six", "True"],
        ["Four plus four equals eight", "True"]
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
         
    }

     @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle // True, False
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer {
            print("Right")
            
        } else {
            print("Wrong")
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
        } else {
            questionNumber = 0
        }
        
        updateUI()
    }
        
    func updateUI()  {
        questionLabel.text = quiz[questionNumber][0 ]

    }
     

}

