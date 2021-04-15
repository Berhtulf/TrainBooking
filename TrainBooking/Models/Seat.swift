//
//  Seat.swift
//  TrainBooking
//
//  Created by Martin Václavík on 06.04.2021.
//

import Foundation

class Seat {
    init(rowNumber: Int, column: String, empty: Bool, selected: Bool = false) {
        self.column = column
        self.rowNumber = rowNumber
        self.empty = empty
        self.selected = selected
    }
    
    let rowNumber: Int
    let column: String
    let empty: Bool
    var selected = false
}
