//
//  LineView.swift
//  CreditScore
//
//  Created by Avinash on 20/02/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import SwiftUI

struct LineView: View {
    let height: CGFloat = 44.0
    var body: some View {
        HStack {
            Text("10%")
            ZStack {
                graphLine
                .background(Color.red)
                HStack(alignment: .center, spacing: 1) {
                    Triangle()
                    .fill(Color.white)
                        .frame(width: 1, height: height, alignment: .trailing)
                    ZStack {
                        arrowView
                        .background(Color.white)
                        .shadow(color: Color.gray.opacity(0.7), radius: 0, x: 8, y: 8)
                        Text("399")
                            .fontWeight(.heavy)
                    }
                }
                .background(Color.white)
            }
            .background(Color.white)
        }
        .padding()
    }
    
    var graphLine: some View {
        HStack {
            Text("300-699")
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
            Text("399")
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

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView()
    }
}
