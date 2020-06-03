//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        choice1Button.layer.cornerRadius = 15
        choice2Button.layer.cornerRadius = 15
        updateUI()

    }

    @IBAction func choicePressed(_ sender: UIButton) {

        
        storyBrain.nextStory(userChoice: sender.currentTitle ?? "Error")
        updateUI()
        
        
    }
    
    func updateUI() {
        
        storyLabel.text = storyBrain.getStoryTitle()
        
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
        
    }

}

