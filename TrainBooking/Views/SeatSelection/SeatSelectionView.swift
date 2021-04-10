//
//  SeatSelectionView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 10.04.2021.
//

import SwiftUI

struct SeatSelectionView: View {
    @EnvironmentObject var viewModel : TrainViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVGrid(columns: [
                GridItem.init(.fixed(40)),
                GridItem.init(.fixed(40)),
                GridItem.init(.fixed(40)),
                GridItem.init(.fixed(40)),
                GridItem.init(.fixed(40))
            ]){
                Text("A")
                Text("B")
                Spacer()
                Text("C")
                Text("D")
                ForEach(viewModel.train!.rows, id: \.self) { row in
                    SeatIcon(seat: row.seats[0])
                        .onTapGesture{
                            if row.seats[0].empty {
                                viewModel.select(seat: row.seats[0])
                            }
                        }
                    SeatIcon(seat: row.seats[1])
                        .onTapGesture{
                            if row.seats[1].empty {
                                withAnimation{
                                    viewModel.select(seat: row.seats[1])
                                }
                            }
                        }
                    Text("\(row.rowNumber)")
                    SeatIcon(seat: row.seats[2])
                        .onTapGesture{
                            if row.seats[2].empty {
                                withAnimation{
                                    viewModel.select(seat: row.seats[2])
                                }
                            }
                        }
                    SeatIcon(seat: row.seats[3])
                        .onTapGesture{
                            if row.seats[3].empty {
                                withAnimation{
                                    viewModel.select(seat: row.seats[3])
                                }
                            }
                        }
                }
            }.frame(width: 250)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
    }
}

struct SeatSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SeatSelectionView()
            .environmentObject(TrainViewModel())
    }
}
