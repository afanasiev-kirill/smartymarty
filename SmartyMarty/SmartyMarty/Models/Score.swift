//
//  Score.swift
//  SmartyMarty
//
//  Created by Kirill Afanasiev on 2023-04-19.
//

import Foundation
class Score{
    
    var score: Int = 0 // The user's score
    var date: Date = Date() // The date of the score

    init() {
        // Empty initializer
    }

    init(score: Int) {
        self.score = score
        self.date = Date()
    }


}
