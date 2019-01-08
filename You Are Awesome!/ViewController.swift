//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Cameron Arrigo on 12/31/18.
//  Copyright © 2018 Cameron Arrigo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var awesomeImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageIndex = -1
    var soundIndex = -1
    let numberOfImages = 10
    let numberOfSounds = 6
    
   
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
       // Show message
        repeat {
            newIndex = Int.random(in: 0..<messages.count)
        } while index == newIndex
        index = newIndex
        messageLabel.text = messages[index]
        // Show image
        repeat{
            newIndex = Int.random(in: 0..<numberOfImages)
        } while imageIndex == newIndex
        imageIndex = newIndex
        awesomeImageView.image = UIImage(named: "image\(imageIndex)")
        
        // Get a random number to use in our soundName file
        repeat{
            newIndex = Int.random(in: 0..<numberOfSounds)
        } while soundIndex == newIndex
        soundIndex = newIndex
        
        // Play a sound
        var soundName = "sound\(soundIndex)"
       
        // Can we get a sound from a file named soundName
        //and put that data in a variable named "sound" so
        // that we can hand it off to our audio player to play?
        if let sound = NSDataAsset(name: soundName) {
            // if this works, the constant "sound" now has the data for our sound named soundName
            // check if sound.data is a sound file
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                // if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
            
        } else {
            // If reading in the NSDataAsset didn't work, tell the developer / report the error.
            print("ERROR: file \(soundName) didn't load.")
        }
    }
}

