// QuizModel.swift - Defines a structure for a simple quiz app
// Created by Kirill Afanasiev on 2023-03-17.

import Foundation

struct Quiz{

    // Properties
    var questionNumber = 0 // The current question number
    var score = 0 // The current score of the user

    // An array of Question objects
    let quiz = [
        Question(image: "Red.png", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Yellow"], rightAnswer: "Red"),
        Question(image: "Green.png", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Yellow"], rightAnswer: "Green"),
        Question(image: "Yellow.png", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Yellow"], rightAnswer: "Yellow"),
        Question(image: "Purple.png", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Purple"], rightAnswer: "Purple"),
        Question(image: "Pink.png", question: "Which color is this?", answers: ["Red", "Green", "Pink", "Yellow"], rightAnswer: "Pink"),
        Question(image: "Brown.png", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Brown"], rightAnswer: "Brown"),
        Question(image: "Black.png", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Black"], rightAnswer: "Black"),
        Question(image: "White.png", question: "Which color is this?", answers: ["Red", "Green", "Blue", "White"], rightAnswer: "White"),
    ]

    // Methods

    // Returns the image name for the current question
    func getImageName() -> String {
        return quiz[questionNumber].questionImage
    }

    // Returns the text of the current question
    func getQuestionText() -> String {
        return quiz[questionNumber].questionText
    }

    // Returns an array of possible answers for the current question
    func getAnswers() -> [String] {
        return quiz[questionNumber].answersArr
    }

    // Returns the progress of the quiz as a float value
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }

    // Returns the current score of the user
    mutating func getScore() -> Int {
        if questionNumber == quiz.count - 1{
            return 0
        }
        return score
    }

    // Moves to the next question in the quiz
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }

    // Checks the user's answer and updates the score accordingly
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
}
// The end of the QuizModel.swift file.



