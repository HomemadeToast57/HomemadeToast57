//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jacob Singer on 11/13/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var totalPerPerson: Double?
    var howManyPeople: Int?
    var tipPercent: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalWithTip: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = "$\(String(format: "%.2f", totalPerPerson!))"
        settingsLabel.text = "Split between \(String(howManyPeople!)) people, with \(tipPercent!) tip."
        totalWithTip.text = "Total with tip: $ \(String(format: "%.2f",totalPerPerson! * Double(howManyPeople!)))"

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

    

}
