//
//  ViewController.swift
//  Right on Target
//
//  Created by ramdau on 14.8.23..
//

import UIKit

class GuessNumberViewController: UIViewController {
    var game: Game<SecretNumericValue>!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = (GameFactory.getNumericGame() as! Game<SecretNumericValue>)
        updateLabelWithSecretNumber(newText: String(game.secretValue.value))
    }
    
    // MARK: View - Model Interaction
    
    @IBAction func checkNumber() {
        // obtain slider value
        var userValue = game.secretValue
        userValue.value = Int(slider.value.rounded())
        
        game.calculateScore(secretValue: game.secretValue, userValue: userValue)
        
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        
        updateLabelWithSecretNumber(newText: String(game.secretValue.value))
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

