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
        testfunktion()
    }

    
    
}

