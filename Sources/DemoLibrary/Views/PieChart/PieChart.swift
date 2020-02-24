//
//  PieChart.swift
//  CreditScore
//
//  Created by Avinash on 22/02/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import SwiftUI

struct PieChart: View {
    
    private let score: Angle
    private let scoreColor: Color
    private let pieWidth: CGFloat
    private let targetAngle = Angle(degrees: 0)
    private let startAngle = Angle(degrees: 90)
    private var scoreAngle: Angle {
        return startAngle + score
    }
    
    init(withScore aScore: Angle, scoreColor aScoreColor: Color = Color.green, pieWidth width: CGFloat = 20) {
        score = aScore
        scoreColor = aScoreColor
        pieWidth = width
    }
    
    var body: some View {
        ZStack{
            fullArc
            scoreArc
        }
        .padding()
    }
    
    var scoreArc: some View {
        ArcView(startAngle: startAngle, endAngle: scoreAngle)
        .stroke(scoreColor, lineWidth: pieWidth)
    }
    var fullArc: some View {
        ArcView(startAngle: startAngle, endAngle: targetAngle)
        .stroke(Color.gray, lineWidth: pieWidth)
    }
}

