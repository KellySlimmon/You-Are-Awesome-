//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Kelly Slimmon on 5/17/19.
//  Copyright © 2019 Kelly Slimmon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    var index = -1
    var imageIndex = -1
    var awesomePlayer = AVAudioPlayer()
    var soundIndex = -1
    let numSounds = 6
    let numImages = 10
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex: Int
        repeat{
            newIndex = Int.random(in: 0..<maxValue)
        } while lastNumber == newIndex
        return newIndex
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        if let sound = NSDataAsset(name: soundName){
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch{
                print("ERROR: file\(soundName) couldn't be played as a sound.")
            }
        }else {
            print("ERROR: file\(soundName) didn't load")
        }
    }
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if soundSwitch.isOn == false && soundIndex != -1{
            awesomePlayer.stop()
        }
    }
    @IBAction func showMessagePressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Fantastic!",
                        "You Are Great!",
                        "You're The Bomb!",
                        "U So Cooooool wow", "How can I be you?", "Be my valentine?"]
        
        
        // Display message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        // Display image
        imageIndex = nonRepeatingRandom(lastNumber: imageIndex, maxValue: numImages)
        awesomeImage.image = UIImage(named: "image\(imageIndex)")
        if soundSwitch.isOn {
        // Get a random number to use in our soundName file
            soundIndex = nonRepeatingRandom(lastNumber: soundIndex, maxValue: numSounds)
        // Play a sound
            let soundName = "sound\(soundIndex)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
    }
}
