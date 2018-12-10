//
//  ViewController.swift
//  BullsEye
//
//  Created by Anand  on 02/09/18.
//  Copyright © 2018 Anand . All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblTargetValue: UILabel!
    @IBOutlet weak var lblTotalScore: UILabel!
    @IBOutlet weak var lblRoundNumber: UILabel!

    var diff: Int = 0
    var totalScore = 0
    var currentRound = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let roundedValue = slider.value.rounded()
//        currentValue = Int(roundedValue)
        showTargetValue()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        diff = abs(targetValue-currentValue)
        var points = 100 - diff

        let title :String
        if(diff == 0){
            title = "Perfect"
            points += 100
        }else if(diff <  5){
            title = "You almost did it!"
            if(diff == 1){
                points += 50
            }
        }else if(diff < 10){
            title = "Pretty good!"
        }else{
            title = "Not even close..."
        }
        totalScore += points
        let message = "You scored \(points) points!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.showTargetValue()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
//        showTargetValue()
//        lblTotalScore.text = String(totalScore)
//        lblRoundNumber.text = String(currentRound)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
      //  print("The current value of slider now : \(slider.value)")
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func showTargetValue(){
        targetValue = random(min: 1, max: 100)
        lblTargetValue.text = String(targetValue)
        currentValue = 50
        currentRound += 1
        slider.value = Float(currentValue)
        lblRoundNumber.text = String(currentRound)
        lblTotalScore.text = String(totalScore)
    }
    
    func random(min: Int, max: Int) -> Int {
        precondition(min <= max)
        let randomizer = GKRandomSource.sharedRandom()
        return min + randomizer.nextInt(upperBound: max - min + 1)
    }
    
    @IBAction func startOver(){
        totalScore = 0
        currentRound = 0
        showTargetValue()
    }
}

