//
//  QuestionModel.swift
//  SmartyMarty
//
//  Created by Kirill Afanasiev on 2023-04-07.
//

import Foundation

struct Question {
    let questionImage : String
    let questionText: String
    let answersArr: [String]
    let correctAnswer: String
    
    //The initialiser needs to be updated to match the new multiple choice quiz data.
    init(image: String, question: String, answers: [String], rightAnswer: String) {
        questionImage = image
        questionText = question
        answersArr = answers
        correctAnswer = rightAnswer
    }
}

