//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Cameron Arrigo on 12/31/18.
//  Copyright © 2018 Cameron Arrigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("The View Loaded!")
    }
    @IBAction func showMessagePressed(_ sender: UIButton) {
        let message1 = "You Are Awesome!"
        let message2 = "You Are Great!"
        let message3 = "You Are Amazing!"
        
        if messageLabel.text == message1 {
            messageLabel.text = message2
        } else if messageLabel.text == message2 {
            messageLabel.text = message3
        } else {
            messageLabel.text = message1
        }
    }

}

