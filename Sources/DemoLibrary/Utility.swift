//
//  Utility.swift
//  CreditScore
//
//  Created by Avinash on 23/02/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import SwiftUI
import Foundation

extension Color {
    //Support only 3 digit signed Int
    static private var scoreColor = Color.green
    static func fromInt(_ num: Int) -> Color {
        
        let t = Array("\(num < 100 ? 100 : num)")
        let red = 1.0 - Double(String(t[0]))!/Double(10)
        let green = 1.0 - Double(String(t[1]))!/Double(10)
        let blue = 1.0 - Double(String(t[2]))!/Double(10)
        scoreColor = Color(red: red, green: green, blue: blue)
        return scoreColor
    }
}
