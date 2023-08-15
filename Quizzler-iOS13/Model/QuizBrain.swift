//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Stefanus Albert Wilson on 8/7/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation


struct Quiz{
    
    var questionNumber = 0
    var score = 0
    
    var reachEnd = false
    
    
    let quiz = [
        Question(q: "Siapakah penulis novel 'Harry Potter'?", a: ["J.K. Rowling", "Stephen King", "George R.R. Martin"], c: "J.K. Rowling"),
        Question(q: "Apa ibu kota Indonesia?", a: ["Jakarta", "Surabaya", "Bandung"], c: "Jakarta"),
        Question(q: "Siapakah presiden pertama Indonesia?", a: ["Soekarno", "Joko Widodo", "Suharto"], c: "Soekarno"),
        Question(q: "Berapa hasil dari 7 + 9?", a: ["14", "15", "16"], c: "16"),
        Question(q: "Apa nama tokoh fiksi superhero berkepala laba-laba?", a: ["Superman", "Batman", "Spider-Man"], c: "Spider-Man"),
        Question(q: "Siapakah penulis puisi 'Aku'?", a: ["Chairil Anwar", "W.S. Rendra", "Sapardi Djoko Damono"], c: "Chairil Anwar"),
        Question(q: "Apa lambang negara Indonesia?", a: ["Garuda", "Harimau", "Kuda"], c: "Garuda"),
        Question(q: "Berapa jumlah provinsi di Indonesia?", a: ["30", "32", "34"], c: "34"),
        Question(q: "Siapakah penemu telepon?", a: ["Thomas Edison", "Alexander Graham Bell", "Nikola Tesla"], c: "Alexander Graham Bell"),
        Question(q: "Apa warna dasar pada bendera Indonesia?", a: ["Merah", "Putih", "Biru"], c: "Merah"),
        Question(q: "Siapakah pelukis terkenal dari Italia yang melukis 'Mona Lisa'?", a: ["Pablo Picasso", "Vincent van Gogh", "Leonardo da Vinci"], c: "Leonardo da Vinci"),
        Question(q: "Apa bahasa resmi yang digunakan di Jepang?", a: ["Mandarin", "Jepang", "Korea"], c: "Jepang"),
        Question(q: "Siapakah ilmuwan yang merumuskan hukum gravitasi?", a: ["Albert Einstein", "Isaac Newton", "Galileo Galilei"], c: "Isaac Newton"),
        Question(q: "Apa judul film trilogi 'The Dark Knight'?", a: ["The Dark Knight Rises", "The Dark Knight Returns", "The Dark Knight"], c: "The Dark Knight"),
        Question(q: "Siapakah penulis drama 'Romeo dan Juliet'?", a: ["William Shakespeare", "Arthur Miller", "Anton Chekhov"], c: "William Shakespeare"),
        Question(q: "Apa lambang negara Amerika Serikat?", a: ["Bintang", "Elang", "Harimau"], c: "Elang"),
        Question(q: "Berapa jumlah tulang rusuk pada manusia?", a: ["12", "24", "30"], c: "24"),
        Question(q: "Siapakah presiden Amerika Serikat ke-44?", a: ["Barack Obama", "Donald Trump", "Joe Biden"], c: "Barack Obama"),
        Question(q: "Apa singkatan dari Perserikatan Bangsa-Bangsa?", a: ["UNESCO", "ASEAN", "PBB"], c: "PBB"),
        Question(q: "Siapakah penulis novel 'To Kill a Mockingbird'?", a: ["Harper Lee", "F. Scott Fitzgerald", "Ernest Hemingway"], c: "Harper Lee")
    ]
    
    func getQuestion() -> String {
        return quiz[questionNumber].question
    }
    
    func getAnswer()-> [String] {
        return quiz[questionNumber].answer
    }
    
    func getProgress() -> Float{
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    
    mutating func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() {
        if(questionNumber + 1 < quiz.count){
            questionNumber += 1
            reachEnd = false
        }
        
        else{
            reachEnd = true
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(answer: String) -> Bool{
        if(answer == quiz[questionNumber].choice){
            score += 1
            return true
        }
        
        else{
            return false
        }
    }
}


