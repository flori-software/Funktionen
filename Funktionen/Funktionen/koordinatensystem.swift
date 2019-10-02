//
//  koordinatensystem.swift
//  Funktionen
//
//  Created by Arkadiusz Paluszek on 02.10.19.
//  Copyright © 2019 Arkadiusz Paluszek. All rights reserved.
//

import Foundation
import UIKit

// Der Mittelpunkt wird als ein "Set" definiert (hat keine bestimmte Reihenfolge, Zuordnung key -> value)
var mittelpunkt = [String: Double]()

func koordinatensystem(_ canvas: Canvas) {
    let bildschirm_breite = canvas.bounds.width
    let bildschirm_hoehe  = canvas.bounds.height
    print("Bildschirm ist \(bildschirm_breite) x \(bildschirm_hoehe)")
    let x = Double(bildschirm_breite / 2)
    let y = Double(bildschirm_hoehe * 0.4)
    mittelpunkt["x"] = x
    mittelpunkt["y"] = y
    let x_max = Double(bildschirm_breite - 20)
    let y_max = Double(bildschirm_hoehe * 0.8)
    
    // Achsen
    let y_achse = linie(x_start: x, y_start: 20, x_ende: x, y_ende: y_max, farbe: .blue, staerke: 1)
    canvas.warenanlieferung(linie: y_achse)
    let x_achse = linie(x_start: 20, y_start: y, x_ende: x_max, y_ende: y, farbe: .blue, staerke: 1)
    canvas.warenanlieferung(linie: x_achse)
    
    // Einheiten
    
}

func umrechnung_einheiten_in_px(x: Double, y: Double) {
    
}

func testfunktion() {
    // Als 1. Test zeichnen wir den Funktionsgraphen von y = 0.5x - 2
    
}
