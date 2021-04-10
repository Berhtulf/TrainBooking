//
//  TrainViewModel.swift
//  TrainBooking
//
//  Created by Martin Václavík on 06.04.2021.
//

import Foundation

class TrainViewModel: ObservableObject {
    @Published var train: Train?
    @Published var selectedSeat: Seat?
    
    @Published var fromCity : String = "Bandung"
    @Published var toCity : String = "Semarang"
    
    @Published var fromStation : String = "Bandung Station"
    @Published var toStation : String = "Semarang Tawang"

    init(rows: Int = 15) {
        train = generateTrainWith(rows: rows)
    }

    
    //MARK: - Intents
    func select(seat: Seat) {
        self.selectedSeat = seat
    }
    func switchDestination() {
        let tempStation = fromStation
        fromStation = toStation
        toStation = tempStation
        
        let tempCity = fromCity
        fromCity = toCity
        toCity = tempCity
        
        selectedSeat = nil
    }
    
    //MARK: - Private funcs
    private func generateTrainWith(rows: Int) -> Train {
        var retvalRows = [Row]()
        for i in 0..<rows {
            retvalRows.append(generateRow(index: i))
        }
        return Train(rows: retvalRows)
    }
    private func generateRow(index: Int) -> Row {
        Row(rowNumber: index+1, seats: generateSeats(index: index+1))
    }
    private func generateSeats(index: Int) -> [Seat]{
        var seats = [Seat]()
        
        seats.append(Seat(rowNumber: index, column: "A", empty: Bool.random()))
        seats.append(Seat(rowNumber: index, column: "B", empty: Bool.random()))
        seats.append(Seat(rowNumber: index, column: "C", empty: Bool.random()))
        seats.append(Seat(rowNumber: index, column: "D", empty: Bool.random()))
        
        return seats
    }
}
