//
//  ViewController.swift
//  band
//
//  Created by Isabel  Lee on 16/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, MusicStatusDelegate {

    var editPannel: EditPannel?
    var tempEditPannel: EditPannel?
    let band = Band()
    let infoButton = UIButton(frame: CGRect(x: 620.0 , y: 540.0, width: 60.0, height: 60.0))
    let playButton = UIButton(frame: CGRect(x: 680.0 , y: 540.0, width: 60.0, height: 60.0))
    let clearButton = UIButton(frame: CGRect(x: 740.0 , y: 540.0, width: 60.0, height: 60.0))
    var notes: [ComposedNotes] = []
    let snowView = LightingView(frame: CGRect(x: 0, y: 0, width: 800, height: 600))
    let stage = UIImageView(frame: CGRect(x: 0, y: 0, width: 800, height: 600))
    let splashScreen = SplashScreen()
    let splashScreenImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 800, height: 600))
    let startButton = UIButton(frame: CGRect(x: 620.0 , y: 500.0, width: 100.0, height: 100.0))
    let infoPage = InfoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.setImage(UIImage(named: "startButton"), for: .normal)
        startButton.addTarget(self, action: #selector(start(_:)), for: UIControlEvents.touchUpInside)
        
        DispatchQueue.global(qos: .background).async {
            self.tempEditPannel = EditPannel()
            DispatchQueue.main.async {
                self.editPannel = self.tempEditPannel
                self.editPannel!.composedNoteList.last?.delegate = self
                self.view.addSubview(self.startButton)
                self.addBlinkingAnimation(view: self.startButton.imageView!)
            }
        }
    
        view.addSubview(splashScreen)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.addSubview(splashScreen)
        splashScreen.animateLogo()
        
    }
    
    func start(_ button: UIButton) {
        splashScreen.removeSplashScreen()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.splashScreen.removeFromSuperview()
            self.stage.image = UIImage(named: "stage")
            self.snowView.alpha = 0
            self.view.addSubview(self.stage)
            self.view.addSubview(self.snowView)
            self.view.addSubview(self.band)
            self.view.addSubview(self.editPannel!)
            self.addButtons()
        }
    }
    
    func addButtons() {
        playButton.setImage(UIImage(named: "playButton"), for: .normal)
        playButton.addTarget(self, action: #selector(playButton(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(playButton)
        
        clearButton.setImage(UIImage(named: "clearAllButton"), for: .normal)
        clearButton.addTarget(self, action: #selector(clearButton(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(clearButton)
        
        infoButton.setImage(UIImage(named: "infoButton"), for: .normal)
        infoButton.addTarget(self, action: #selector(infoButton(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(infoButton)
    }
    
    func infoButton(_ button: UIButton!) {
        print("showing info")
        self.view.addSubview(infoPage)
        infoPage.showInfo()
    }
    
    func playButton(_ button: UIButton!) {
        band.startBand()
        playButton.isEnabled = false
        self.playButton.alpha = 0.5
        self.snowView.alpha = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.editPannel!.playSong()
        }
    }
    
    func clearButton(_ button: UIButton!) {
        editPannel!.clearAll()
    }
    
    func musicEnded() {
        SharedAudioPlayer.player.playNote(name: "clapping")
        self.band.stopAllAnimation()
        UIView.animate(withDuration: 6, animations: {
            self.snowView.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.playButton.isEnabled = true
            self.playButton.alpha = 1
        }
    }
    
    func addBlinkingAnimation(view: UIView) {
        let key = "opacity"
        let animation = CABasicAnimation(keyPath: key)
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.autoreverses = true
        animation.repeatCount = FLT_MAX
        view.layer.add(animation, forKey: key)
    }
}

