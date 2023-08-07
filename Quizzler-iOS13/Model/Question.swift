//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Stefanus Albert Wilson on 8/7/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    var question: String
    var answer: [String]
    var choice: String
    
    init(q: String, a: [String], c: String){
        question = q
        answer = a
        choice = c
    }
}
