//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Kelly Slimmon on 5/17/19.
//  Copyright © 2019 Kelly Slimmon. All rights reserved.
//

echo "# you-are-awesome-KellySlimmon" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/bcswiftsummer19/you-are-awesome-KellySlimmon.git
git push -u origin master


import UIKit
import AVFoundation

class ViewController: UIViewController {

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
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int{
        var newIndex: Int
        repeat{
            newIndex = Int.random(in: 0..<maxValue)
        } while index == newIndex
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
        
        // Get a random number to use in our soundName file
        soundIndex = nonRepeatingRandom(lastNumber: soundIndex, maxValue: numSounds)
        
        // Play a sound
        let soundName = "sound\(soundIndex)"
        playSound(soundName: soundName, audioPlayer: &awesomePlayer)
    }
}
        
//        messageLabel.text = messages.randomElement()!
//        messageLabel.text = messages[index]
//
//        if index == messages.count - 1{
//            index = 0
//        } else {
//            index = index + 1
//        }
//
//        let message1 = "You Are Awesome!"
//        let message2 = "You Are Great!"
//        let message3 = "You Are Amazing!"
//        if messageLabel.text == message1 {
//            messageLabel.text = message2
//        } else if messageLabel.text == message2 {
//            messageLabel.text = message3
//        } else {
//            messageLabel.text = message1
//        }
//        messageLabel.textColor = UIColor.magenta
    


