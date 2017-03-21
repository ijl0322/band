//
//  TromboneNotes.swift
//  band
//
//  Created by Isabel  Lee on 17/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class TromboneNotes: Notes {
    required init(name: String) {
        let newName = "Trombone/t_" + name
        print("\(newName)")
        super.init(name: newName)
    }
}
