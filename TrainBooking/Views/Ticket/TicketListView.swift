//
//  TicketListView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 10.04.2021.
//

import SwiftUI

struct TicketListView: View {
    var seat : Seat
    
    var body: some View {
        ZStack{
            VStack{
                VStack(spacing: 10){
                    HStack{
                        Text("Full Name")
                        Spacer()
                        Text("Jimmy Spencer")
                    }
                    HStack{
                        Text("Seat Place")
                        Spacer()
                        Text("Exec 5 / Seat \(seat.rowNumber)\(seat.column)")
                    }
                }.padding()
                HStack{
                    Circle()
                        .frame(width: 30, height: 30)
                        .offset(x: -15.0)
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [3]))
                        .foregroundColor(Color.gray.opacity(0.5))
                        .frame(height: 1)
                        .padding(.vertical)
                    Circle()
                        .frame(width: 30, height: 30)
                        .offset(x: 15.0)
                }
                VStack{
                    Text("Booking Code G154AM")
                    HStack(spacing: 2){
                        ForEach(0..<30){ i in
                            Rectangle()
                                .frame(width: CGFloat.random(in: 1...8),
                                       height: 50)
                        }
                    }
                }.padding()
            }
            .background(Color.white)
            .cornerRadius(20)
            .padding()
            .background(Color.init(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)))
            .cornerRadius(20)
        }.padding()
    }
}


struct TicketListView_Previews: PreviewProvider {
    static var previews: some View {
        TicketListView(seat: Seat(rowNumber: 1, column: "A", empty: false))
    }
}
