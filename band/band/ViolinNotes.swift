//
//  ViolinNotes.swift
//  band
//
//  Created by Isabel  Lee on 23/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ViolinNotes: Notes {
    required init(name: String) {
        let newName = "v_" + name
        print("\(newName)")
        super.init(name: newName)
    }
}
