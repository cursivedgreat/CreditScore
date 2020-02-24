//
//  Response.swift
//  CreditScore
//
//  Created by Avinash on 23/02/2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - Response
public struct CreditScore: Codable {
    var user: User?
    var servey: Servey?
}

// MARK: - Servey
public struct Servey: Codable {
    var slabs = [Slab]()
}

// MARK: - Slab
public struct Slab: Codable {
    var scorePoint: Int?
    let start, end, totalPercentage: Int
    
    mutating func color() -> Color {
        return .green
    }
}

// MARK: - User
public struct User: Codable {
    let score: Int
    let date: TimeInterval
}
