//
//  TrainJourneyView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 10.04.2021.
//

import SwiftUI

struct TrainJourneyView: View {
    @EnvironmentObject var viewModel : TrainViewModel
    
    @State var opened: Bool = false
    
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


struct TrainJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        TrainJourneyView()
            .environmentObject(TrainViewModel())
    }
}
