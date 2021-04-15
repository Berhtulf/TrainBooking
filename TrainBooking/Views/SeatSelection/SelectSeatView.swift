//
//  SelectSeatView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 05.04.2021.
//

import SwiftUI


struct SelectSeatView: View {
    @EnvironmentObject var viewModel : TrainViewModel
    
    var body: some View {
        VStack{
            LegendView()
            Spacer()
            HStack{
                SeatSelectionView()
                Spacer()
                HStack{
                    Image(systemName: "chevron.left")
                    Text("Executive 5")
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .foregroundColor(.white)
                        .background(Capsule().foregroundColor(Color.init(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))))
                    Image(systemName: "chevron.right")
                }
                .fixedSize()
                .rotationEffect(.init(degrees: 90))
                .frame(width: 30, height: 180)
            }
            if let selected = viewModel.selectedSeat {
                VStack(spacing: 20){
                    HStack{
                        Text("Your seat")
                        Spacer()
                        Text("Exec 5 / Seat \(selected.rowNumber)\(selected.column)")
                            .animation(.none)
                    }
                    HStack{
                        Text("Total price")
                        Spacer()
                        Text("$48.00")
                    }
                 NavigationLink("Continue", destination: TicketView())
                    .buttonStyle(PrimaryActionButtonStyle())
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
            }
        }
        .padding()
        .background(Color.init(#colorLiteral(red: 0.9379398227, green: 0.9422804713, blue: 0.9528906941, alpha: 1)).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Select seat", displayMode: .inline)
    }
}

struct SelectSeatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SelectSeatView()
                .environmentObject(TrainViewModel())
                .navigationBarTitle("",displayMode: .inline)
        }
    }
}
