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
    //Support only 1 digit signed Int
    static private var scoreColor = Color.green
    static func fromDelta(_ delta: Double) -> Color {
        let green = 1.0 - delta
        let red = delta
        let blue: Double = 0.0
        scoreColor = Color(red: red, green: green, blue: blue)
        return scoreColor
    }
}
