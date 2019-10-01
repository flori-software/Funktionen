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
        koordinatensystem()
    }

    func koordinatensystem() {
        let bildschirm_breite = canvas.bounds.width
        let bildschirm_hoehe  = canvas.bounds.height
        print("Bildschirm ist \(bildschirm_breite) x \(bildschirm_hoehe)")
        
        // Testlinie
        let linie1 = linie(x_start: 400, y_start: 20, x_ende: 400, y_ende: 600, farbe: .blue, staerke: 1)
        canvas.warenanlieferung(linie: linie1)
        let linie2 = linie(x_start: 20, y_start: 300, x_ende: 400, y_ende: 300, farbe: .blue, staerke: 1)
        canvas.warenanlieferung(linie: linie2)
    }
}

