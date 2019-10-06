//
//  ViewController.swift
//  Funktionen
//
//  Created by Arkadiusz Paluszek on 30.09.19.
//  Copyright © 2019 Arkadiusz Paluszek. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
        koordinatensystem(canvas)
        let funktion1  = funktion(x: -1, z: 3, farbe: .green)
        let funktion2  = funktion(x: 0.5, z: -2)
        let funktionen = [funktion1, funktion2]
        testfunktion(canvas, funktionen: funktionen)
    }

    
    
}

