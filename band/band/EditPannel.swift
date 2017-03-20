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
    let numSlots = 20
    var composedNoteList: [ComposedNotes] = []
    let slotSize = 70.0
    let buttonSize = 70.0
    
    init(){
        super.init(frame: CGRect(x: 0.0 , y: 0.0, width: 1366.0, height: 1024.0))
        self.backgroundColor = UIColor.black
        
        addTromboneSlots()
        addSaxphoneSlots()
        addDrumSlots()
        addButtons()
        addDrumButtons()
        addSaxphoneButtons()
        addComposedNotes()
        addPlayAndClear()
        
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
    
    func addPlayAndClear() {
        let button: UIButton = UIButton(frame: CGRect(x: 500.0 , y: 450.0, width: 120.0, height: 50.0))
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(playButton(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(button)
        
        let button2: UIButton = UIButton(frame: CGRect(x: 500.0 + 127.0 , y: 500.0, width: 120.0, height: 50.0))
        button2.backgroundColor = UIColor.red
        button2.addTarget(self, action: #selector(clearSongButton(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(button2)
        
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
            let newSlot = DrumSlots(x: Double(i)*slotSize, y: 120.0)
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
            let newSlot = SaxphoneSlots(x: Double(i)*slotSize, y: 240.0)
            newSlot.tag = i + 300
            let tapGestureRecignizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            tapGestureRecignizer.delegate = newSlot
            tapGestureRecignizer.numberOfTapsRequired = 2
            newSlot.addGestureRecognizer(tapGestureRecignizer)
            self.addSubview(newSlot)
        }
    }
    
    func addComposedNotes() {
        for _ in 0...numSlots{
            let newComposedNote = ComposedNotes()
            if let lastElement = composedNoteList.last {
                lastElement.next = newComposedNote
            }
            composedNoteList.append(newComposedNote)
        }
    }
    
    func addButtons() {
        for i in 0...13 {
            let newButton = TromboneNoteButtons(name: allNotes[i], x: Double(i)*buttonSize, y: 900.0)
            let panGestureRecignizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
            panGestureRecignizer.delegate = newButton
            newButton.addGestureRecognizer(panGestureRecignizer)
            //newButton.tag = i+1
            self.addSubview(newButton)
        }
    }
    
    func addDrumButtons() {
        for i in 0...2 {
            let newButton = DrumNoteButtons(name: allDrumNotes[i], x: Double(i)*buttonSize, y: 800.0)
            let panGestureRecignizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
            panGestureRecignizer.delegate = newButton
            newButton.addGestureRecognizer(panGestureRecignizer)
            //newButton.tag = i+1
            self.addSubview(newButton)
        }
    }
    
    func addSaxphoneButtons() {
        for i in 0...13 {
            let newButton = SaxphoneNoteButtons(name: allNotes[i], x: Double(i)*buttonSize, y: 700.0)
            let panGestureRecignizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
            panGestureRecignizer.delegate = newButton
            newButton.addGestureRecognizer(panGestureRecignizer)
            //newButton.tag = i+1
            self.addSubview(newButton)
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

