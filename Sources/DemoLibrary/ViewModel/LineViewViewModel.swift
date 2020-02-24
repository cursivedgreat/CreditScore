//
//  LineViewViewModel.swift
//  CreditScore
//
//  Created by Avinash on 23/02/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import SwiftUI

@available(OSX 10.15, *)
class LineViewViewModel: ObservableObject, Identifiable {
    let slab: Slab
    private let height: CGFloat = 44.0

    init(withSlab aSlab: Slab) {
        self.slab = aSlab
    }
    
    func bgColor() -> Color {
        return Color.fromDelta(slab.colorDelta ?? 1)
    }
    
    func getArrowOffset(forWidth width: CGFloat) -> CGFloat {
        var offsetX:CGFloat = 0.0
        if let scorePoint = slab.scorePoint {
            // -width/2 as view lies in zStack
            offsetX =  (CGFloat(scorePoint - slab.start)/CGFloat(slab.end-slab.start) * width )-width/2
        }
        print("offset is \(offsetX)")
        
        return offsetX
    }
}
