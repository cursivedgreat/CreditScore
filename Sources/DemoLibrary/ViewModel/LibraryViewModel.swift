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
    
    func getLeftViewData() -> (startValue: Int, targetValue: Int, userScore: Int, valuationDate: String) {
        var sValue = 900
        var tValue = 0
        
        var date = "Unknown"
        let score = creditScore.user?.score ?? 0
        if let t = creditScore.user?.date {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            date = formatter.string(from: Date(timeIntervalSince1970: t))
        }
        
        if let slabs = creditScore.servey?.slabs {
            for slab in slabs {
                if slab.start < sValue {
                    sValue = slab.start
                }
                if slab.end > tValue {
                    tValue = slab.end
                }
            }
        }
        return (sValue, tValue, score, date)
    }
    
    func getBarViewData() -> [Slab] {
        let userScore = creditScore.user?.score ?? 0
        return (self.creditScore.servey?.slabs ?? [])
            .map { slab in
                var tSlab = slab
                if tSlab.start < userScore && userScore < tSlab.end {
                    tSlab.scorePoint = userScore
                }
                return tSlab
        }
    }
}
