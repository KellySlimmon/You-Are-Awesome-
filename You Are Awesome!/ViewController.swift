//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Kelly Slimmon on 5/17/19.
//  Copyright © 2019 Kelly Slimmon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }


    @IBAction func showMessagePressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Fantastic!",
                        "You Are Great!",
                        "You're The Bomb!",
                        "U So Cooooool wow can i be you"]
        var newIndex: Int
        repeat{
            newIndex = Int.random(in: 0..<messages.count)
        } while index == newIndex
                index = newIndex
                messageLabel.text = messages[index]
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
    }
    


