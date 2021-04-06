//
//  SelectSeatView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 05.04.2021.
//

import SwiftUI

struct SeatIcon: View{
    @EnvironmentObject var viewModel: TrainViewModel
    var seat: Seat
    
    var body: some View{
        if viewModel.selectedSeat == seat{
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.yellow)
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
        }else if (seat.empty){
            Image(systemName: "xmark.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
        }else{
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 40, height: 40)
                .foregroundColor(.yellow)
        }
    }
}

struct SelectSeatView: View {
    @EnvironmentObject var viewModel : TrainViewModel
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image(systemName: "squareshape.fill")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.yellow)
                Text("Available")
                Spacer()
                Rectangle()
                    .stroke(Color.yellow)
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                Text("Selected")
                Spacer()
                Image(systemName: "xmark.square.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                Text("Unavailable")
                Spacer()
            }
            
            HStack{
                ScrollView(showsIndicators: false){
                    LazyVGrid(columns: [
                        GridItem.init(.flexible(minimum: 40, maximum: 40)),
                        GridItem.init(.flexible(minimum: 40, maximum: 40)),
                        GridItem.init(.flexible(minimum: 40, maximum: 40)),
                        GridItem.init(.flexible(minimum: 40, maximum: 40)),
                        GridItem.init(.flexible(minimum: 40, maximum: 40))
                    ]){
                        Text("A")
                        Text("B")
                        Spacer()
                        Text("C")
                        Text("D")
                        ForEach(viewModel.train!.rows, id: \.self) { row in
                            SeatIcon(seat: row.seats[0])
                                .onTapGesture{
                                    if !row.seats[0].empty {
                                        viewModel.select(seat: row.seats[0])
                                    }
                                }
                            SeatIcon(seat: row.seats[1])
                                .onTapGesture{
                                    if !row.seats[1].empty {
                                        withAnimation{
                                            viewModel.select(seat: row.seats[1])
                                        }
                                    }
                                }
                            Text("\(row.rowNumber)")
                            SeatIcon(seat: row.seats[2])
                                .onTapGesture{
                                    if !row.seats[2].empty {
                                        withAnimation{
                                            viewModel.select(seat: row.seats[2])
                                        }
                                    }
                                }
                            SeatIcon(seat: row.seats[3])
                                .onTapGesture{
                                    if !row.seats[3].empty {
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
                Spacer()
                HStack{
                    Image(systemName: "chevron.left")
                    Text("Executive 5")
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .foregroundColor(.white)
                        .background(Capsule().foregroundColor(Color.init(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))))
                    Image(systemName: "chevron.right")
                }.rotationEffect(.init(degrees: 90))
                .fixedSize()
                .frame(width: 70, height: 180)
            }
            .padding()
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
                    NavigationLink(
                        destination: TicketView(),
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 250, height: 60)
                                    .foregroundColor(.yellow)
                                    .cornerRadius(10.0)
                                Text("Continue")
                                    .foregroundColor(.black)
                            }
                        })
                }.padding()
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal)
            }
        }
        .padding([.top, .leading, .trailing])
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        .background(Color.init(#colorLiteral(red: 0.9379398227, green: 0.9422804713, blue: 0.9528906941, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
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
