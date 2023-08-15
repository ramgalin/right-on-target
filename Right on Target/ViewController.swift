//
//  ViewController.swift
//  Right on Target
//
//  Created by ramdau on 14.8.23..
//

import UIKit

class ViewController: UIViewController {
    // guessed number
    var number: Int = 0
    
    // game round
    var round: Int = 0
    
    // sum of points
    var points: Int = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkNumber() {
        if round == 0 {
            // the game just has started
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
            self.round = 1
        } else {
            // obtain slider value
            let numSlider = Int(self.slider.value.rounded())
            
            // calculate points
            if numSlider > self.number {
                points += 50 - numSlider + self.number
            } else {
                points += 50 - self.number + numSlider
            }
            
            if round == 5 {
                // the last round
                let alert = UIAlertController(
                    title: "Finished",
                    message: "You got \(self.points) points",
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
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
            
            // generate random random and set it to label
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
        }
    }


}

