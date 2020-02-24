//
//  LineView.swift
//  CreditScore
//
//  Created by Avinash on 20/02/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import SwiftUI

struct LineView: View {
   private let height: CGFloat = 44.0
    
    private let viewModel: LineViewViewModel
    init(withViewModel aModel: LineViewViewModel) {
        self.viewModel = aModel
    }
    
    var body: some View {
        HStack {
            Text("\(viewModel.slab.totalPercentage)%")
            sleepingBarView
            .background(Color.white)
        }
        .padding()
    }
    
    var sleepingBarView: some View {
        if let scorePoint = viewModel.slab.scorePoint {
          return  AnyView(
            ZStack(alignment: .leading) {
                graphLine
                    .background(viewModel.bgColor())
                GeometryReader { geometry in
                    HStack {
                        Triangle()
                        .fill(Color.white)
                            .frame(width: 1, height: self.height, alignment: .trailing)
                       
                        ZStack {
                            self.arrowView
                            .background(Color.white)
                            .shadow(color: Color.gray.opacity(0.7), radius: 0, x: 8, y: 8)
                            Text("\(scorePoint)")
                                .fontWeight(.heavy)
                        }
                    }
                    .background(Color.white)
                    .offset(x: self.viewModel.getArrowOffset(forWidth: geometry.size.width))
                }
            })
        } else {
          return  AnyView(graphLine
            .background(viewModel.bgColor()))
        }
    }
    
    var graphLine: some View {
        HStack {
            Text("\(viewModel.slab.start)-\(viewModel.slab.end)")
                .fontWeight(.regular)
                .foregroundColor(Color.white)
                .frame(height: height)
                .padding([.leading, .trailing])
                .offset(x: 10, y: -4)
            Spacer()
         }
    }
    
    var arrowView: some View {
        HStack {
            Text("\(viewModel.slab.scorePoint ?? 0)")
                .fontWeight(.bold)
            .foregroundColor(.clear)
                .frame(width: 55, height: height)
        }
            
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: -rect.midY, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        return path
    }
}

