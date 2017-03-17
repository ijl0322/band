//
//  NoteButtons.swift
//  band
//
//  Created by Isabel  Lee on 16/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit
class NoteButtons: UIImageView, UIGestureRecognizerDelegate {
    //var note: Notes!
    var note: TromboneNotes!
    var name: String!
    var tapGestureRecognizer: UITapGestureRecognizer?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(name: String, x: Double, y: Double) {
        super.init(frame: CGRect(x: x , y: y, width: 100.0, height: 100.0))
        let newName = "t_" + name
        self.image = UIImage(named: newName)
        //self.note = Notes(name: name)
        self.note = TromboneNotes(name: name)
        self.name = name
        self.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        let panGestureRecignizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
        tapGestureRecognizer.delegate = self
        panGestureRecignizer.delegate = self
        self.addGestureRecognizer(tapGestureRecognizer)
        self.addGestureRecognizer(panGestureRecignizer)
        
    }
    
    func handleTap(_: UITapGestureRecognizer){
        print("tapped")
        self.note.playNote()
    }
    
    func handlePan(_ recognizer: UIPanGestureRecognizer){
        let translation = recognizer.translation(in: recognizer.view)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: recognizer.view)
    }
    
}
