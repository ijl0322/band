//
//  EditPannel.swift
//  band
//
//  Created by Isabel  Lee on 19/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import Foundation
import UIKit

class EditPannel: UIView {
    let allNotes = ["Do", "Re", "Mi", "Fa", "So", "La", "Ti", "Do_h", "Re_h", "Mi_h", "Fa_h", "So_h", "La_h", "Ti_h"]
    let allDrumNotes = ["single", "double", "triple"]
    let numSlots = 19
    var isMenuHidden = false
    var composedNoteList: [ComposedNotes] = []
    var tromboneButtons: [TromboneNoteButtons] = []
    var drumButtons: [DrumNoteButtons] = []
    var saxphoneButtons: [SaxphoneNoteButtons] = []
    let slotSize = size.noteSize.rawValue
    let buttonSize = size.noteSize.rawValue
    let controlButtonSize = size.controlButtonSize.rawValue
    
    init(){
        super.init(frame: CGRect(x: 0.0 , y: 0.0, width: size.screenWidth.rawValue, height: size.screenHeight.rawValue))
        //self.backgroundColor = UIColor.black
        
        addTromboneSlots()
        addSaxphoneSlots()
        addDrumSlots()
        addTromboneButtons()
        addDrumButtons()
        addSaxphoneButtons()
        addComposedNotes()
        addButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func playButton(_ button: UIButton!) {
        composedNoteList[0].playSong()
    }
    
    func clearSongButton(_ button: UIButton!) {
        clearAll()
    }
    
    
    func showMenuButton(_ button: UIButton!) {
        
        switch button.tag {
        case 1:
            showTromboneButtons()
            hideDrumButtons()
            hideSaxphoneButtons()
            break
        case 2:
            hideTromboneButtons()
            showDrumButtons()
            hideSaxphoneButtons()
            break
        case 3:
            hideDrumButtons()
            hideTromboneButtons()
            showSaxphoneButtons()
            break
        default:
            break
        
        }
    }
    
    func addButtons() {
        let playButton: UIButton = UIButton(frame: CGRect(x: 800.0 , y: 850.0, width: 120.0, height: 50.0))
        playButton.backgroundColor = UIColor.white
        playButton.addTarget(self, action: #selector(playButton(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(playButton)
        
        let clearButton: UIButton = UIButton(frame: CGRect(x: 900, y: 850.0, width: 120.0, height: 50.0))
        clearButton.backgroundColor = UIColor.red
        clearButton.addTarget(self, action: #selector(clearSongButton(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(clearButton)
        
        let menuTButton: UIButton = UIButton(frame: CGRect(x: 0, y: 850.0, width: 50.0, height: 50.0))
        menuTButton.backgroundColor = UIColor.cyan
        menuTButton.tag = 1
        menuTButton.addTarget(self, action: #selector(showMenuButton(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(menuTButton)
        
        let menuDButton: UIButton = UIButton(frame: CGRect(x: 50, y: 850.0, width: 50.0, height: 50.0))
        menuDButton.backgroundColor = UIColor.purple
        menuDButton.addTarget(self, action: #selector(showMenuButton(_:)), for: UIControlEvents.touchUpInside)
        menuDButton.tag = 2
        self.addSubview(menuDButton)
        
        let menuSButton: UIButton = UIButton(frame: CGRect(x: 0, y: 900.0, width: 50.0, height: 50.0))
        menuSButton.backgroundColor = UIColor.green
        menuSButton.tag = 3
        menuSButton.addTarget(self, action: #selector(showMenuButton(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(menuSButton)
    }
    
    func addTromboneSlots() {
        for i in 0...numSlots {
            let newSlot = TromboneSlots(x: Double(i)*slotSize, y: 0.0)
            newSlot.tag = i + 100
            let tapGestureRecignizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            tapGestureRecignizer.delegate = newSlot
            tapGestureRecignizer.numberOfTapsRequired = 2
            newSlot.addGestureRecognizer(tapGestureRecignizer)
            self.addSubview(newSlot)
        }
    }
    
    func addDrumSlots() {
        for i in 0...numSlots {
            let newSlot = DrumSlots(x: Double(i)*slotSize, y: 60.0)
            newSlot.tag = i + 200
            let tapGestureRecignizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            tapGestureRecignizer.delegate = newSlot
            tapGestureRecignizer.numberOfTapsRequired = 2
            newSlot.addGestureRecognizer(tapGestureRecignizer)
            self.addSubview(newSlot)
        }
    }
    
    func addSaxphoneSlots() {
        for i in 0...numSlots {
            let newSlot = SaxphoneSlots(x: Double(i)*slotSize, y: 120.0)
            newSlot.tag = i + 300
            let tapGestureRecignizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            tapGestureRecignizer.delegate = newSlot
            tapGestureRecignizer.numberOfTapsRequired = 2
            newSlot.addGestureRecognizer(tapGestureRecignizer)
            self.addSubview(newSlot)
        }
    }
    
    func addComposedNotes() {
//        for _ in 0...numSlots{
//            let newComposedNote = ComposedNotes()
//            if let lastElement = composedNoteList.last {
//                lastElement.next = newComposedNote
//            }
//            composedNoteList.append(newComposedNote)
//        }
        composedNoteList = Songs().odeToJoy()
    }
    
    func addTromboneButtons() {
        for i in 0...13 {
            let newButton = TromboneNoteButtons(name: allNotes[i], x: Double(i)*buttonSize+controlButtonSize, y: 875.0)
            let panGestureRecignizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
            panGestureRecignizer.delegate = newButton
            newButton.addGestureRecognizer(panGestureRecignizer)
            newButton.alpha = 1
            tromboneButtons.append(newButton)
            self.addSubview(newButton)
        }
    }
    
    func addDrumButtons() {
        for i in 0...2 {
            let newButton = DrumNoteButtons(name: allDrumNotes[i], x: Double(i)*buttonSize+controlButtonSize, y: 875.0)
            let panGestureRecignizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
            panGestureRecignizer.delegate = newButton
            newButton.addGestureRecognizer(panGestureRecignizer)
            newButton.alpha = 0
            drumButtons.append(newButton)
            self.addSubview(newButton)
        }
    }
    
    func addSaxphoneButtons() {
        for i in 0...13 {
            let newButton = SaxphoneNoteButtons(name: allNotes[i], x: Double(i)*buttonSize+controlButtonSize, y: 875.0)
            let panGestureRecignizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
            panGestureRecignizer.delegate = newButton
            newButton.addGestureRecognizer(panGestureRecignizer)
            newButton.alpha = 0
            saxphoneButtons.append(newButton)
            self.addSubview(newButton)
        }
    }
    
    func hideTromboneButtons() {
        for i in 1...tromboneButtons.count{
            UIView.animate(withDuration: 0.1, delay: 0.05*Double(i), options: [], animations:{
                self.tromboneButtons[self.tromboneButtons.count - i].alpha = 0
            }, completion: nil)
        }
    }
    
    func hideDrumButtons() {
        for i in 1...drumButtons.count{
            UIView.animate(withDuration: 0.1, delay: 0.05*Double(i), options: [], animations:{
                self.drumButtons[self.drumButtons.count - i].alpha = 0
            }, completion: nil)
        }
    }
    
    func hideSaxphoneButtons() {
        for i in 1...saxphoneButtons.count{
            UIView.animate(withDuration: 0.1, delay: 0.05*Double(i), options: [], animations:{
                self.saxphoneButtons[self.saxphoneButtons.count - i].alpha = 0
            }, completion: nil)
        }
    }
    
    
    func showTromboneButtons() {
        for i in 0..<tromboneButtons.count{
            UIView.animate(withDuration: 0.1, delay: 0.05*Double(i), options: [], animations:{
                self.tromboneButtons[i].alpha = 1
            }, completion: nil)
        }
    }
    
    func showDrumButtons() {
        for i in 0..<drumButtons.count{
            UIView.animate(withDuration: 0.1, delay: 0.05*Double(i), options: [], animations:{
                self.drumButtons[i].alpha = 1
            }, completion: nil)
        }
    }
    
    func showSaxphoneButtons() {
        for i in 0..<saxphoneButtons.count{
            UIView.animate(withDuration: 0.1, delay: 0.05*Double(i), options: [], animations:{
                self.saxphoneButtons[i].alpha = 1
            }, completion: nil)
        }
    }
    
    
    func handlePan(_ recognizer: UIPanGestureRecognizer){
        
        let translation = recognizer.translation(in: recognizer.view)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: recognizer.view)
        
        guard let NoteButton = recognizer.view as? NoteButtons else {
            print("cannot unwrap button")
            return
        }
        
        var typeTag = 0
        switch NoteButton.instrument! {
        case .Trombone:
            typeTag = 100
            break
        case .Saxphone:
            typeTag = 300
            break
        case .Drum:
            typeTag = 200
            break
        default:
            break
        }
        
        
        if recognizer.state == UIGestureRecognizerState.ended {
            
            for i in 0...numSlots{
                handleMove(imgTag: typeTag + i, recognizer: recognizer)
            }
            NoteButton.center = CGPoint(x: NoteButton.originalX, y: NoteButton.originalY)
        }
    }
    
    func handleMove(imgTag: Int, recognizer: UIPanGestureRecognizer) {
        guard let tempImgView = self.viewWithTag(imgTag) as? NoteSlots else {
            print("unsucessful unwrap")
            return
        }
        
        guard let NoteButton = recognizer.view as? NoteButtons else {
            print("cannot unwrap button")
            return
        }

        let smallerFrame = tempImgView.frame.insetBy(dx: 20.0, dy: 20.0)
        
        if (recognizer.view?.frame)!.intersects(smallerFrame) {
            tempImgView.image = UIImage(named: NoteButton.fullName)
            switch tempImgView.instrument! {
            case .Trombone:
                composedNoteList[imgTag%100].addTNote(note: NoteButton.name)
                break
            case .Saxphone:
                composedNoteList[imgTag%100].addSNote(note: NoteButton.name)
                break
            case .Drum:
                composedNoteList[imgTag%100].addDNote(note: NoteButton.name)
                break
            default:
                break
            }
        }
            
    }
    
    func clearAll() {
        for i in 0...numSlots {
            if let slot = self.viewWithTag(i + 100) as? NoteSlots{
                slot.image = nil
            }
            if let slot = self.viewWithTag(i + 200) as? NoteSlots{
                slot.image = nil
            }
            if let slot = self.viewWithTag(i + 300) as? NoteSlots{
                slot.image = nil
            }
            composedNoteList[i].clearNote()
        }
        
    }
    
    func playSong() {
        composedNoteList[0].playSong()
    }

    func handleTap(_ recognizer: UITapGestureRecognizer){
        guard let view = recognizer.view else {
            print("cannot unwrap in function handleTap")
            return
        }
        
        print("slot tapped")
        let noteSlot = view as! NoteSlots
        let index = noteSlot.tag % 100
        switch noteSlot.instrument! {
        case .Trombone:
            composedNoteList[index].tNote = composedNoteList[index].tNone
            noteSlot.image = nil
            break
        case .Saxphone:
            composedNoteList[index].sNote = composedNoteList[index].sNone
            noteSlot.image = nil
            break
        case .Drum:
            composedNoteList[index].dNote = composedNoteList[index].dNone
            noteSlot.image = nil
            break
        default:
            break
        }
    }


}

