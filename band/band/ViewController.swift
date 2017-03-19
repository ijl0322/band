//
//  ViewController.swift
//  band
//
//  Created by Isabel  Lee on 16/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let editPannel = EditPannel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(editPannel)
    }
        
}

