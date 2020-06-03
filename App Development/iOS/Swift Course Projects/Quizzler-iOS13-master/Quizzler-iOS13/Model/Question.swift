//
//  QuizModel.swift
//  Quizzler-iOS13
//
//  Created by Jacob Singer on 11/10/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct Question {
    let text: String
    
    //Multiple choice questions have multiple answers, an Array of Strings would work for our quiz data.
    let answers: [String]
    //Look at the data in the quiz array, there is a seperate string that is the correctAnswer.
    let rightAnswer: String
    
    //The initialiser needs to be updated to match the new multiple choice quiz data.
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
}
