//
//  Utility.swift
//  CreditScore
//
//  Created by Avinash on 23/02/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import SwiftUI

extension Color {
    //Support only 3 digit signed Int
    static private var scoreColor = Color.green
    static func fromInt(_ num: Int) -> Color {
        let t = Double(num)
        let red = 1.0 - t/900
        let green = t/900
        let blue: Double = 0.0
        scoreColor = Color(red: red, green: green, blue: blue)
        return scoreColor
    }
}
