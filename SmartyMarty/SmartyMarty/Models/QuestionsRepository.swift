//
//  QuestionsRepository.swift
//  SmartyMarty
//
//  Created by Kirill Afanasiev on 2023-04-07.
//

import Foundation

struct QuestionsRepository{
    // Array of question objects related to colors
    let questionsColors = [
        Question(image: "red", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Yellow"], rightAnswer: "Red"),
        Question(image: "green", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Yellow"], rightAnswer: "Green"),
        Question(image: "blue", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Yellow"], rightAnswer: "Blue"),
        Question(image: "yellow", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Yellow"], rightAnswer: "Yellow"),
        Question(image: "purple", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Purple"], rightAnswer: "Purple"),
        Question(image: "orange", question: "Which color is this?", answers: ["Red", "Orange", "Blue", "Yellow"], rightAnswer: "Orange"),
        Question(image: "pink", question: "Which color is this?", answers: ["Red", "Green", "Pink", "Yellow"], rightAnswer: "Pink"),
        Question(image: "brown", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Brown"], rightAnswer: "Brown"),
        Question(image: "black", question: "Which color is this?", answers: ["Red", "Green", "Blue", "Black"], rightAnswer: "Black"),
        Question(image: "white", question: "Which color is this?", answers: ["Red", "Green", "Blue", "White"], rightAnswer: "White"),
        Question(image: "gray", question: "Which color is this?", answers: ["Gray", "Pink", "Blue", "Green"], rightAnswer: "Gray"),
    ]
    
    // Array of question objects related to numbers
    let questionNumbers = [
        Question(image: "0", question: "What number is this?", answers: ["Zero", "Five", "Ten", "One"], rightAnswer: "Zero"),
        Question(image: "1", question: "What number is this?", answers: ["Seven", "One", "Five", "Three"], rightAnswer: "One"),
        Question(image: "2", question: "What number is this?", answers: ["Nine", "Two", "Six", "Three"], rightAnswer: "Two"),
        Question(image: "3", question: "What number is this?", answers: ["Five", "Seven", "Three", "Two"], rightAnswer: "Three"),
        Question(image: "4", question: "What number is this?", answers: ["Eight", "Four", "Six", "Nine"], rightAnswer: "Four"),
        Question(image: "5", question: "What number is this?", answers: ["One", "Ten", "Five", "Two"], rightAnswer: "Five"),
        Question(image: "6", question: "What number is this?", answers: ["Six", "Nine", "Four", "Three"], rightAnswer: "Six"),
        Question(image: "7", question: "What number is this?", answers: ["Ten", "Three", "Seven", "Four"], rightAnswer: "Seven"),
        Question(image: "8", question: "What number is this?", answers: ["Two", "Eight", "Five", "Six"], rightAnswer: "Eight"),
        Question(image: "9", question: "What number is this?", answers: ["Nine", "Four", "Two", "One"], rightAnswer: "Nine"),
        Question(image: "10", question: "What number is this?", answers: ["Three", "Eleven", "Ten", "Six"], rightAnswer: "Ten")
    ]
}

