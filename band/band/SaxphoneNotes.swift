//
//  SaxphoneNotes.swift
//  band
//
//  Created by Isabel  Lee on 19/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class SaxphoneNotes: Notes {
    required init(name: String) {
        let newName = "s_" + name
        print("\(newName)")
        super.init(name: newName)
    }
}
