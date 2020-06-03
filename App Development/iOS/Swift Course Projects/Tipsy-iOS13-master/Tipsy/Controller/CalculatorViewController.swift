//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipDecimal = 0.1
    var numberOfPeople = 2
    var userInput = ""
    var total: Double = 0
    var tipPercent: String = ""
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        tipPercent = sender.currentTitle ?? "Unknown"
        func setTipDecimal() {
            if sender.currentTitle == "0%" {
                tipDecimal = 0.0
            }
            else if sender.currentTitle == "10%" {
                tipDecimal = 0.1
            }
            else if sender.currentTitle == "20%" {
                tipDecimal = 0.2
            }
            
            //Close keyboard
            billTextField.endEditing(true)
        }
        
        setTipDecimal()
    }
    
    //Get value from UITextView
    
    func userInputToDecimal() -> Double {
        userInput = String(billTextField.text!)
        var userDecimal = Double(userInput)
        return userDecimal ?? 0.0
    }
    
    func calculateTotal() -> String {
        total = Double((userInputToDecimal() + (userInputToDecimal() * tipDecimal)) / Double(numberOfPeople))
        return String(format: "%.2f", total)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(calculateTotal())
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        
        destinationVC.totalPerPerson = total
        destinationVC.howManyPeople = numberOfPeople
        destinationVC.tipPercent = tipPercent
    }
}

