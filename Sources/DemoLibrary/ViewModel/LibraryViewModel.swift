//
//  LibraryViewModel.swift
//  CreditScore
//
//  Created by Avinash on 23/02/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import SwiftUI


final public class LibraryViewModel: ObservableObject {
    @Published var creditScore = CreditScore()
    @Published var isLandscape: Bool
    
    required public init(withResponse score: CreditScore, inLandscape landscape: Bool) {
        self.creditScore = score
        self.isLandscape = landscape
        print("Currently isLandscape \(landscape)")
    }
    
    func getLeftViewData() -> (startValue: Int, targetValue: Int, userScore: Int, valuationDate: String, bgDelta: Double) {
        var sValue = 900
        var tValue = 0
        var date = "Unknown"
        var delta: Double = 0
        
        if let t = creditScore.user?.date {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            date = formatter.string(from: Date(timeIntervalSince1970: t))
        }
        
        let score = creditScore.user?.score ?? 0
        let slabs = self.creditScore.servey?.slabs ?? []
        
        for (index, slab) in slabs.enumerated() {
            if slab.start < sValue {
                sValue = slab.start
            }
            if slab.end > tValue {
                tValue = slab.end
            }
            
            if slab.start < score && score < slab.end {
                delta = Double(index+1)/Double(slabs.count)
            }
        }
        return (sValue, tValue, score, date, delta)
    }
    
    func getBarViewData() -> [Slab] {
        let score = creditScore.user?.score ?? 0
        let responseSlabs = self.creditScore.servey?.slabs ?? []
        var slabs = [Slab]()
        
        for (index, slab) in responseSlabs.enumerated() {
            var tSlab = slab
            tSlab.colorDelta = Double(index+1)/Double(responseSlabs.count)
            if slab.start < score && score < slab.end {
                tSlab.scorePoint = score
            }
            slabs.append(tSlab)
        }
        return slabs
    }
}
