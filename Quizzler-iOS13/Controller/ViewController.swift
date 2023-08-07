//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Stefanus Albert Wilson on 8/7/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    var quiz = Quiz()
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UpdateUI()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        let answered = sender.currentTitle!
        
        let checked = quiz.checkAnswer(answer: answered)
        
        if(checked){
            sender.backgroundColor = UIColor.green
            playSoundCorrect()
        }
        
        else{
            sender.backgroundColor = UIColor.red
            playSoundWrong()
        }
        
        quiz.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(UpdateUI), userInfo: nil, repeats: false)
    }
    
    @objc func UpdateUI(){
        questionLabel.text = quiz.getQuestion()
        
        let answerChoices = quiz.getAnswer()
        
        firstChoice.setTitle(answerChoices[0], for: .normal)
        secondChoice.setTitle(answerChoices[1], for: .normal)
        thirdChoice.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quiz.getProgress()
        scoreLabel.text = "Score: \(quiz.getScore())"
        
        firstChoice.backgroundColor = UIColor.clear
        secondChoice.backgroundColor = UIColor.clear
        thirdChoice.backgroundColor = UIColor.clear
        
    }
    
    func playSoundCorrect(){
        guard let url = Bundle.main.url(forResource: "correct", withExtension: "mp3") else { return }

            do {
                try! AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try! AVAudioSession.sharedInstance().setActive(true)

                player = try! AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)



                guard let player = player else { return }

                player.play()

            }
    }
    
    func playSoundWrong(){
        guard let url = Bundle.main.url(forResource: "wrong", withExtension: "mp3") else { return }

            do {
                try! AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try! AVAudioSession.sharedInstance().setActive(true)

                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                player = try! AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                /* iOS 10 and earlier require the following line:
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                guard let player = player else { return }

                player.play()

            }
    }
    
}

