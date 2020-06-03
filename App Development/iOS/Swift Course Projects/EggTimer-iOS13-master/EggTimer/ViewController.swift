//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var hardnessLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    var player: AVAudioPlayer!
    
    
    @IBAction func eggPressed(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        
        progressBar.progress = 0
        secondsPassed = 0
        titleLabel.text = "How do you like your eggs?"
        hardnessLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        updateTimer()
        
       
    }

    @objc func updateTimer() {
        
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(Float(secondsPassed)/Float(totalTime))
           
            var percentage = Int(((Float(Float(secondsPassed)/Float(totalTime))))*100)
            
            titleLabel.text = "\(Int(percentage))% | \(totalTime - secondsPassed) seconds left"
        } else {
            timer.invalidate()
            titleLabel.text = "Done"
             let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
        }
    }


}
