//
//  SharedNoneNotes.swift
//  band
//
//  Created by Isabel  Lee on 23/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

class SharedNoneNote {
    
    // Static class variable
    static let violin = ViolinNotes(name: "None")
    static let saxphone = SaxphoneNotes(name: "None")
    static let trombone = TromboneNotes(name: "None")
    static let drum = DrumNotes(name: "None")
    
    /// This prevents others from using the default '()' initializer for this class.
    private init() {}
    
}

