//
//  ViewController.swift
//  Right on Target
//
//  Created by ramdau on 14.8.23..
//

import UIKit

class ViewController: UIViewController {
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    // MARK: View - Model Interaction
    
    @IBAction func checkNumber() {
        // obtain slider value
        let numSlider = Int(self.slider.value.rounded())
        
        game.calculateScore(with: numSlider)
        
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    // MARK: Update View
    // Update label text
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    // Show alert with the score
    private func showAlertWith(score: Int) {
        // the last round
        let alert = UIAlertController(
            title: "Finished",
            message: "You got \(score) points",
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(
                title: "Start new game",
                style: .default,
                handler: nil
            )
        )
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

