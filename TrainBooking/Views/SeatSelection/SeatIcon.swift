//
//  SeatIcon.swift
//  TrainBooking
//
//  Created by Martin Václavík on 10.04.2021.
//

import SwiftUI

struct SeatIcon: View{
    @EnvironmentObject var viewModel: TrainViewModel
    var seat: Seat
    
    var body: some View{
        if seat.selected {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.yellow)
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
        }else if (seat.empty){
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 40, height: 40)
                .foregroundColor(.yellow)
        }else{
            Image(systemName: "xmark.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
        }
    }
}

struct SeatIcon_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            SeatIcon(seat: Seat(rowNumber: 1, column: "A", empty: false))
            SeatIcon(seat: Seat(rowNumber: 1, column: "A", empty: true))
            SeatIcon(seat: Seat(rowNumber: 1, column: "A", empty: true, selected: true))
        }
        .environmentObject(TrainViewModel())
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
