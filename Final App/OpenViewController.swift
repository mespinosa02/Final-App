//
//  OpenViewController.swift
//  Final App
//
//  Created by SBAUser on 5/8/20.
//  Copyright © 2020 Michelle Espinosa. All rights reserved.
//

import UIKit
import AVFoundation

class OpenViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(name:"Tequila - The Champs")

        // Do any additional setup after loading the view.
    }
    
    func playSound(name: String){
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: \(error.localizedDescription). Could not initialize AVAudioPlayer Object")
            }
        } else {
            print("ERROR: Could not read data from file \(name)")
        }
    }
    
    
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        if audioPlayer != nil {
            audioPlayer.stop()
        }
        performSegue(withIdentifier: "ShowTableView", sender: nil)
    }
    
}
