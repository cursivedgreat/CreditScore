//
//  ArcView.swift
//  CreditScore
//
//  Created by Avinash on 22/02/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import SwiftUI

struct ArcView: Shape {
    var startAngle: Angle
    var endAngle: Angle
    private let clockwise = false
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        return path
    }
}

