//
//  Color.swift
//  Right on Target
//
//  Created by ramdau on 19.8.23..
//

import Foundation
import UIKit

struct Color : Equatable {
    var red: UInt8
    var green: UInt8
    var blue: UInt8
    
    init() {
        red = 0
        green = 0
        blue = 0
    }
    
    init(from color: UIColor) {
        red = UInt8(CGFloat(255)*color.cgColor.components![0])
        green = UInt8(CGFloat(255)*color.cgColor.components![1])
        blue = UInt8(CGFloat(255)*color.cgColor.components![2])
    }
    
    
    
    func getRandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func getHEXString() -> String {
        var redPart = String(red, radix: 16, uppercase: true)
        if red <= 16 {
            redPart = "0\(redPart)"
        }
        
        var greenPart = String(red, radix: 16, uppercase: true)
        if red <= 16 {
            greenPart = "0\(greenPart)"
        }
        
        var bluePart = String(red, radix: 16, uppercase: true)
        if red <= 16 {
            bluePart = "0\(bluePart)"
        }
        
        return "\(redPart)\(greenPart)\(bluePart)"
    }
    
    func getUIColor() -> UIColor {
        let redFloat: Float = Float(red) / 255;
        let greenFloat: Float = Float(green) / 255;
        let blueFloat: Float = Float(blue) / 255;
        
        return UIColor(red: CGFloat(redFloat), green: CGFloat(greenFloat), blue: CGFloat(blueFloat), alpha: 1)
    }
    
    static func == (lhs: Color, rhs: Color) -> Bool {
        return
            lhs.red == rhs.red &&
            lhs.green == rhs.green &&
            lhs.blue == rhs.blue
    }
}
