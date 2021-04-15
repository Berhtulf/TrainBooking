//
//  DestinationSelectView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 10.04.2021.
//

import SwiftUI

struct DestinationSelectView: View {
    @EnvironmentObject var viewModel: TrainViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("From")
                    .font(.headline)
                    .foregroundColor(Color.secondary)
                Text(viewModel.fromStation)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            .offset(y: 20)
            HStack{
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [3]))
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(height: 1)
                Button(action: {
                    viewModel.switchDestination()
                }, label: {
                    Image(systemName: "arrow.up.arrow.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(20.0)
                        .accessibility(label: Text("Switch destination"))
                })
            }
            VStack(alignment: .leading){
                Text("To")
                    .font(.headline)
                    .foregroundColor(Color.secondary)
                Text(viewModel.toStation)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            .offset(y: -20)
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(30.0)
        .padding()
    }
}


struct DestinationSelectView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSelectView()
    }
}
