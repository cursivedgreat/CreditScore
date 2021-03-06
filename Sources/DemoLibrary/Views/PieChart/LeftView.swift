//
//  LeftView.swift
//  CreditScore
//
//  Created by Avinash on 22/02/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import SwiftUI


struct LeftView: View {
    private var viewModel: LeftViewViewModel
   
    
    init(withViewModel aViewModel: LeftViewViewModel) {
        self.viewModel = aViewModel
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .center) {
                HStack {
                    PieChart(withScore: viewModel.scoreAngle(), scoreColor: Color.fromDelta(viewModel.bgDelta), pieWidth: CGFloat(20))
                    Text("\(viewModel.target)")
                        .offset(x: -2*viewModel.margin, y: CGFloat(12))
                }
                Text("\(viewModel.start)")
                    .offset(x:CGFloat(0), y: -2*viewModel.margin)
            }
            .offset(x: viewModel.margin, y: viewModel.margin)
            .aspectRatio(1.0, contentMode: .fit)
            
            Text("\(viewModel.score)")
                .font(.system(size: 40, weight: .bold))
                .offset(x: 0, y: viewModel.margin/2)
            
        }
    }
}

