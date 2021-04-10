//
//  ContentView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 05.04.2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: TrainViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Where do you want to go?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    ProfilePictureView()
                }
                .padding(.horizontal)
                DestinationSelectView()
                HStack{
                    Link(destination: URL(string: "http://vaclavik-dev.maweb.eu")!, label: {
                        Image(systemName: "exclamationmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.init(#colorLiteral(red: 0.8515912294, green: 0.8465295434, blue: 0.8554823995, alpha: 1)))
                            .cornerRadius(10)
                    })
                    NavigationLink("Continue", destination: SelectSeatView())
                        .buttonStyle(PrimaryActionButtonStyle())
                }.padding(.horizontal)
                Spacer()
                
                InfoImageView()
            }
            .navigationBarHidden(true)
            .navigationBarTitle("Destination")
            .background(Color.init(#colorLiteral(red: 0.9379398227, green: 0.9422804713, blue: 0.9528906941, alpha: 1)).edgesIgnoringSafeArea(.all))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TrainViewModel())
    }
}
