//
//  GuessColorViewController.swift
//  Right on Target
//
//  Created by ramdau on 18.8.23..
//

import UIKit

class GuessColorViewController: UIViewController {

    var game: Game<SecretColorValue>!
    
    var correctButtonTag: Int = 0
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    var buttonCollection: [UIButton]!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = (GameFactory.getColorGame() as! Game<SecretColorValue>)
        buttonCollection = [button1, button2, button3, button4]
        updateScene()
    }
    
    
    
    // MARK: View - Model Interaction
    
    @IBAction func checkColor(sender: UIButton) {
        // obtain button color value
        var userValue = game.secretValue
        userValue.value = Color(from: sender.backgroundColor!)
        
        game.calculateScore(secretValue: game.secretValue, userValue: userValue)
        
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        
        updateScene()
    }
    
    // MARK: Update View
    private func updateScene() {
        updateSecretColorLabel(withText: game.secretValue.value.getHEXString())
        updateButtons(withSecretValue: game.secretValue)
    }
    
    private func updateSecretColorLabel(withText newHEXColorText: String) {
        label.text = "#\(newHEXColorText)"
    }
    
    private func updateButtons(withSecretValue secretValue: SecretColorValue) {
        correctButtonTag = Array(1...4).randomElement()!
        buttonCollection.forEach { button in
            if button.tag == correctButtonTag {
                button.backgroundColor = secretValue.value.getUIColor()
            } else {
                var copySecretValue = secretValue
                copySecretValue.setRandomValue()
                button.backgroundColor = copySecretValue.value.getUIColor()
            }
        }
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
