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
var mittelpunkt     = [String: Double]()
var anzahl_x: Int   = 0
var anzahl_y: Int   = 0
var einheit: Double = 50

struct funktion {
    var x: Double = 0
    var z: Double = 0
}

func koordinatensystem(_ canvas: Canvas) {
    
    let bildschirm_breite = Double(canvas.bounds.width)
    let bildschirm_hoehe  = Double(canvas.bounds.height)
    print("Bildschirm ist \(bildschirm_breite) x \(bildschirm_hoehe)")
    let x = Double(bildschirm_breite / 2)
    let y = Double(bildschirm_hoehe * 0.4)
    mittelpunkt["x"] = x
    mittelpunkt["y"] = y
    let x_max = bildschirm_breite - 20
    let y_max = bildschirm_hoehe * 0.8
    
    // Achsen
    let y_achse = linie(x_start: x, y_start: 10, x_ende: x, y_ende: y_max, farbe: .blue, staerke: 1)
    canvas.warenanlieferung(linie: y_achse)
    let x_achse = linie(x_start: 20, y_start: y, x_ende: x_max, y_ende: y, farbe: .blue, staerke: 1)
    canvas.warenanlieferung(linie: x_achse)
    
    // Einheiten
    anzahl_x = Int(floor(bildschirm_breite / 2 / einheit))
    anzahl_y = Int(floor(bildschirm_hoehe * 0.8 / 2 / einheit))
    
    // Markierungen auf der X-Achse
    for position in 1...anzahl_x {
        let x_pos = mittelpunkt["x"]! + Double(position) * einheit
        let x_neg = mittelpunkt["x"]! - Double(position) * einheit
        let y_start = mittelpunkt["y"]! + 10
        let y_ende  = mittelpunkt["y"]! - 10
        
        let markierung_pos = linie(x_start: x_pos, y_start: y_start, x_ende: x_pos, y_ende: y_ende, farbe: .blue, staerke: 1)
        let markierung_neg = linie(x_start: x_neg, y_start: y_start, x_ende: x_neg, y_ende: y_ende, farbe: .blue, staerke: 1)
        
        canvas.warenanlieferung(linie: markierung_pos)
        canvas.warenanlieferung(linie: markierung_neg)
    }

    // Markierungen auf der Y-Achse
    
    for position in 1...anzahl_y {
        let y_pos = mittelpunkt["y"]! + Double(position) * einheit
        let y_neg = mittelpunkt["y"]! - Double(position) * einheit
        let x_start = mittelpunkt["x"]! + 10
        let x_ende  = mittelpunkt["x"]! - 10
        
        let markierung_pos = linie(x_start: x_start, y_start: y_pos, x_ende: x_ende, y_ende: y_pos, farbe: .blue, staerke: 1)
        let markierung_neg = linie(x_start: x_start, y_start: y_neg, x_ende: x_ende, y_ende: y_neg, farbe: .blue, staerke: 1)
        
        canvas.warenanlieferung(linie: markierung_pos)
        canvas.warenanlieferung(linie: markierung_neg)
    }
    
}

func umrechnung_einheiten_in_px(x: Double, y: Double) -> punkt{
    let new_x = mittelpunkt["x"]! + x * einheit
    // Y wird im view andersrum als im Koordinatensystem gerechnet: 0 ist ganz oben und nach unten hin werden die Werte größer
    let new_y = mittelpunkt["y"]! - y * einheit
    return punkt(x: new_x, y: new_y)
}

func testfunktion(_ canvas: Canvas) {
    // Als 1. Test zeichnen wir den Funktionsgraphen von y = 0.5x - 2
    var fx = funktion()
    fx.x = 0.5
    fx.z = -2
    
    // Berechnen des Anfangs- und des Endpunktes des Funktionsgraphen
    let y_start: Double = Double(anzahl_x) * fx.x * -1 + fx.z
    print("Errechnetes y_start ist \(y_start) bei x -\(anzahl_x) und z \(fx.z)");
    let y_ende: Double  = Double(anzahl_x) * fx.x + fx.z
    print("Errechnetes y_ende ist \(y_ende)");
    let x_start: Double = Double(anzahl_x) * -1
    let x_ende: Double  = Double(anzahl_x)
    
    let startpunkt = umrechnung_einheiten_in_px(x: x_start, y: y_start)
    let endpunkt   = umrechnung_einheiten_in_px(x: x_ende, y: y_ende)
    
    let funktionsgraph = linie(x_start: startpunkt.x, y_start: startpunkt.y, x_ende: endpunkt.x, y_ende: endpunkt.y, farbe: .gray, staerke: 2)
    
    canvas.warenanlieferung(linie: funktionsgraph)
}
