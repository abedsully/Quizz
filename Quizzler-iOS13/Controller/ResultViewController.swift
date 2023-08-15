//
//  ResultViewController.swift
//  Quizzler-iOS13
//
//  Created by Stefanus Albert Wilson on 8/15/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit


class ResultViewController: UIViewController {
    
    var score: Int = 0
    

    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(score)/20"
    
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
