//
//  Seat.swift
//  TrainBooking
//
//  Created by Martin Václavík on 06.04.2021.
//

import Foundation

struct Seat : Hashable {
    let rowNumber: Int
    let column: String
    let empty: Bool
    var selected = false
}
