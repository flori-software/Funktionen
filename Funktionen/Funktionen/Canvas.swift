//
//  Canvas.swift
//  Funktionen
//
//  Created by Arkadiusz Paluszek on 01.10.19.
//  Copyright © 2019 Arkadiusz Paluszek. All rights reserved.
//

import UIKit

class Canvas: UIView {
    var linien = [linie]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //zeichne_linie(x_start: 100, y_start: 100, x_ende: 300, y_ende: 300, farbe: .green, staerke: 2)
        //zeichne_linie(x_start: 200, y_start: 200, x_ende: 100, y_ende: 300, farbe: .red, staerke: 4)
        for linie in linien {
            zeichne_linie(linie: linie)
        }
    }
    
    func warenanlieferung(linie: linie) {
        linien.append(linie)
        setNeedsDisplay()
    }
    
    func zeichne_linie(linie: linie) {
        //draw(self.frame)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        let startPoint = CGPoint(x: linie.x_start, y: linie.y_start)
        let endPoint   = CGPoint(x: linie.x_ende, y: linie.y_ende)
        context.setStrokeColor(linie.farbe.cgColor)
        context.setLineWidth(linie.staerke)
        context.move(to: startPoint)
        context.addLine(to: endPoint)
        context.strokePath()
        
    }

}

struct linie {
    public var x_start: Double
    public var y_start: Double
    public var x_ende: Double
    public var y_ende: Double
    public var farbe: UIColor
    public var staerke: CGFloat
}

struct punkt {
    public var x: Double
    public var y: Double
}

struct funktion {
    var x: Double = 0
    var z: Double = 0
    var farbe: UIColor = .black
}
