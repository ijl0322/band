//
//  SharedAudioPlayer.swift
//  band
//
//  Created by Isabel  Lee on 21/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import AVFoundation
class SharedAudioPlayer {
    
    // Static class variable
    static let player = SharedAudioPlayer()
    var audioFile: AVAudioPlayer!
    
    /// This prevents others from using the default '()' initializer for this class.
    private init() {}
    
    func playNote(name: String) {
        let audioFileURL = URL(fileURLWithPath: Bundle.main.path(forResource: name, ofType: "wav")!)
        
        do {
            try audioFile = AVAudioPlayer(contentsOf: audioFileURL as URL, fileTypeHint: nil)
            audioFile.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        audioFile.play()
    }

}
