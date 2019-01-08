//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Cameron Arrigo on 12/31/18.
//  Copyright © 2018 Cameron Arrigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var awesomeImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    var index = -1
    var imageIndex = -1
    let numberOfImages = 10
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func showMessagePressed(_ sender: UIButton) {
        
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "When the Genius Bar needs help, they call you",
                        "You Brighten My Day!",
                        "You Make Me Smile!", "You are da bomb",
                        "Hey, fabulous!",
                        "You've got the design skills of Jony Ive",
                        "I can't wait to download your app!"
                        ]
        var newIndex: Int // declares but doesn't initialize the variable
        repeat {
            newIndex = Int.random(in: 0..<messages.count)
        } while index == newIndex
        index = newIndex
        messageLabel.text = messages[index]
        
        repeat{
            newIndex = Int.random(in: 0..<numberOfImages)
        } while imageIndex == newIndex
        
        imageIndex = newIndex
        
        awesomeImageView.image = UIImage(named: "image\(imageIndex)")
        
    }
}

