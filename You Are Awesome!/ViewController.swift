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
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex: Int
        repeat {
            newIndex = Int.random(in: 0..<maxValue)
        } while lastNumber == newIndex
        return newIndex
    }
    
    
    func playSound(soundName: String) {
        // Can we get a sound from a file named soundName
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
        
       // Show message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
       
        // Show image
        imageIndex = nonRepeatingRandom(lastNumber: imageIndex, maxValue: numberOfImages)
        awesomeImageView.image = UIImage(named: "image\(imageIndex)")
        
        // Get a random number to use in our soundName file
        soundIndex = nonRepeatingRandom(lastNumber: soundIndex, maxValue: numberOfSounds)

        
        //Play a sound
        let soundName = "sound\(soundIndex)"
        playSound(soundName: soundName)
        
        
    }
}

