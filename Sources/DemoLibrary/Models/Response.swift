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
    public init() {}
    public var user: User?
    public var servey: Servey?
}

// MARK: - Servey
public struct Servey: Codable {
    public var slabs = [Slab]()
}

// MARK: - Slab
public struct Slab: Codable {
    public let start, end, totalPercentage: Int
    
    //For internal consumption
    var scorePoint: Int?
    var colorDelta: Double?
}

// MARK: - User
public struct User: Codable {
    public let score: Int
    public let date: TimeInterval
}
