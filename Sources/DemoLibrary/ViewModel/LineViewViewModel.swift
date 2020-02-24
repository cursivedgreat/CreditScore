//
//  LineViewViewModel.swift
//  CreditScore
//
//  Created by Avinash on 23/02/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
#if !os(macOS)
import UIKit
#endif

@available(OSX 10.15, *)
class LineViewViewModel: ObservableObject, Identifiable {
    let slab: Slab
    private let height: CGFloat = 44.0

    init(withSlab aSlab: Slab) {
        self.slab = aSlab
    }
}
