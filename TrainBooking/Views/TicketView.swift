//
//  TicketView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 05.04.2021.
//

import SwiftUI

struct TicketView: View {
    @EnvironmentObject var viewModel: TrainViewModel
    @State var expanded = true
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                TicketListView(seat: viewModel.selectedSeat!)
                Text("Train Itenerary")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                TrainJourneyView(opened: $expanded)
                HStack{
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.yellow)
                        .font(.title3)
                    Text("Requirement to Board")
                        .font(.title3)
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .contentShape(Rectangle())
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                
                Spacer()
            }
            .padding()
        }
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        .background(Color.init(#colorLiteral(red: 0.9379398227, green: 0.9422804713, blue: 0.9528906941, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
        .toolbar(content: {
            Button(action: {
                print("Sending email...")
            }, label: {
                Label("Send to email", systemImage: "paperplane")
            })
        })
        .navigationBarTitle("ID G154AM", displayMode: .inline)
    }
}

struct TicketListView: View {
    var seat : Seat
    
    var body: some View {
        ZStack{
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
                HStack{
                    Circle()
                        .frame(width: 30, height: 30)
                        .offset(x: -30.0)
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [6]))
                        .frame(height: 1)
                    Circle()
                        .frame(width: 30, height: 30)
                        .offset(x: 30.0)
                }
                HStack(spacing: 20){
                    Text("Booking Code")
                    Text("G154AM")
                }
                HStack(spacing: 2){
                    ForEach(0..<30){ i in
                        Rectangle()
                            .frame(width: CGFloat.random(in: 1...8),
                                   height: 50)
                    }
                }
            }.padding()
            .background(Color.white)
            .cornerRadius(20)
            .padding()
            .background(Color.init(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)))
            .cornerRadius(20)
        }.padding()
    }
}

struct TrainJourneyView: View {
    @Binding var opened: Bool
    @EnvironmentObject var viewModel : TrainViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Train Journey")
                    .font(.title3)
                Spacer()
                Image(systemName: opened ? "chevron.up" : "chevron.down")
            }
            .contentShape(Rectangle())
            .onTapGesture{
                withAnimation{
                    opened.toggle()
                }
            }
            .padding()
            
            if (opened){
                HStack{
                    VStack(alignment: .leading){
                        Group{
                            Text("20:20")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("Thu, 1 Apr")
                        }
                        Text("7h 20min")
                            .foregroundColor(.yellow)
                            .padding(.vertical)
                        Group{
                            Text("03:40")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("Thu, 2 Apr")
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                    VStack{
                        Circle()
                            .stroke(Color.yellow, lineWidth: 3)
                            .frame(width: 20, height: 20)
                        Rectangle()
                            .frame(width: 1)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 20, height: 20)
                    }.padding(.vertical)
                    Spacer()
                    VStack(alignment: .leading){
                        Group{
                            Text(viewModel.fromCity)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(viewModel.fromStation)
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                        Text("")
                            .foregroundColor(.yellow)
                            .padding()
                        Group{
                            Text(viewModel.toCity)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(viewModel.toStation)
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding([.horizontal, .bottom])
            }
        }
        .background(Color.white)
        .cornerRadius(20)
    }
}


struct TicketView_Previews: PreviewProvider {
    static var model: TrainViewModel {
        let model = TrainViewModel()
        model.select(seat: Seat(rowNumber: 1, column: "A", empty: true))
        return model
    }
    static var previews: some View {
        TicketView()
            .environmentObject(model)
    }
}
