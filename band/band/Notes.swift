//
//  Notes.swift
//  band
//
//  Created by Isabel  Lee on 16/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Notes {
    let name: String
    var audioFile: AVAudioPlayer!
    
    required init(name: String) {
        self.name = name
        let audioFileURL = URL(fileURLWithPath: Bundle.main.path(forResource: name, ofType: "mp3")!)
        
        do {
            try audioFile = AVAudioPlayer(contentsOf: audioFileURL as URL, fileTypeHint: nil)
            audioFile.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }

    }
    
    func playNote() {
        audioFile.play()
    }
}
