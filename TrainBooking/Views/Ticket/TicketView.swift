//
//  TicketView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 05.04.2021.
//

import SwiftUI

struct TicketView: View {
    @EnvironmentObject var viewModel: TrainViewModel
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                TicketListView()
                Text("Train Itenerary")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                TrainJourneyView()
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
        .background(Color.init(#colorLiteral(red: 0.9379398227, green: 0.9422804713, blue: 0.9528906941, alpha: 1)).edgesIgnoringSafeArea(.all))
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
