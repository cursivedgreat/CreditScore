//
//  LeftViewViewModel.swift
//  CreditScore
//
//  Created by Avinash on 23/02/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
//import UIKit
import SwiftUI

class LeftViewViewModel {
    let margin: CGFloat = 20
    let target: Int
    let start: Int
    let score: Int
    let bgDelta: Double
    
    init(startScore sValue: Int,
         targetScore tValue: Int,
         userScore score: Int,
         bgDelta delta: Double
    ) {
        self.target = tValue
        self.start = sValue
        self.score = score
        self.bgDelta = delta
    }
    
    func scoreAngle() -> Angle {
        let scorePoint = Double(score)/Double(target)*270
        return Angle(degrees: scorePoint)
    }
}
