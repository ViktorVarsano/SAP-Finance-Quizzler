//
//  Question.swift
//  SAP Finance Quizzler
//
//  Created by Viktor Varsano on 6.12.20.
//

import Foundation

struct Question {
    let text: String
  
    //Multiple choice questions have multiple answers, an Array of Strings would work for our quiz data.
    let answers: [String]
   
    //Look at the data in the quiz array, there is a seperate string that is the correctAnswer.
    let rightAnswer: String

    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
}
