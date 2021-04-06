//
//  Row.swift
//  TrainBooking
//
//  Created by Martin Václavík on 06.04.2021.
//

import Foundation

struct Row : Identifiable, Hashable {
    let id = UUID()
    let rowNumber: Int
    var seats : [Seat]
}
