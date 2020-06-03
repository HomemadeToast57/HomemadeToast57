//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]

    
    
    @IBOutlet weak var diceView1: UIImageView!
    
    @IBOutlet weak var diceView2: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diceView1.layer.cornerRadius = 15
        diceView2.layer.cornerRadius = 15
        
        rollButton.layer.cornerRadius = 10
        
    }

    @IBAction func rollButton(_ sender: UIButton) {
        //Changes dice picture
        diceView1.image = images[Int.random(in: 0 ... 5)]
        
        
        
        diceView2.image = images[Int.random(in: 0 ..< 5)]
        
        
    }
    

}

