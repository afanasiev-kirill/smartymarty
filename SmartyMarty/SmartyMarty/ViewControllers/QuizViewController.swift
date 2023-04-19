//
//  QuizViewController.swift
//  SmartyMarty
//
//  Created by Kirill Afanasiev on 2023-03-17.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBAction func unwindToQuizViewController(sender : UIStoryboardSegue){
        
    }
    // Outlets to UI elements
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageQuestion: UIImageView!
    
    // Create a Quiz object
    var quizBrain = Quiz()
    
    // Called after the controller's view is loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call updateUI() method
        updateUI()
    }

    // Called when user taps on an answer button
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // Get the user's answer from the button
        let userAnswer = sender.currentTitle!
        
        // Check if the answer is correct and update button color accordingly
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // Move to the next question
        quizBrain.nextQuestion()
        
        // Schedule the updateUI() method after a short delay
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // Update the user interface
    @objc func updateUI() {
        
        if quizBrain.questionNumber == quizBrain.quiz.count - 1{
            let scoreNum = quizBrain.getScore()
            let score = Score(score: scoreNum)
            print("pizda")
            (UIApplication.shared.delegate as! AppDelegate).scores.append(score)

            (UIApplication.shared.delegate as! AppDelegate).insertIntoDatabase(userScore: score)
            
        }
        // Update the question label
        questionLabel.text = quizBrain.getQuestionText()
        
        // Update the answer buttons
        let answerChoices = quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        // Update the image question
        imageQuestion.image = UIImage(named: quizBrain.getImageName())
        
        // Update the progress bar and score label
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        // Clear button colors
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        
    }

}

