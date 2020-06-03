//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!

    @IBAction func registerPressed(_ sender: Any) {
        performSegue(withIdentifier: "welcomeToRegister", sender: self)

    }
    @IBAction func loginPressed(_ sender: Any) {
        performSegue(withIdentifier: "welcomeToLogin", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = K.appName

    }
    

}
