//
//  ContentView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 05.04.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: TrainViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Where do you want to go?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink(
                        destination: Text("Profile"),
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.gray)
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .padding()
                                HStack{
                                    Spacer()
                                    VStack{
                                        Circle()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.red)
                                            .background(Circle().frame(width: 25, height: 25).foregroundColor(.white))
                                            .offset(x: 5, y: -5)
                                        Spacer()
                                    }
                                }
                            }
                            .frame(width: 80, height: 80)
                        })
                        .padding()
                }
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("From")
                            .font(.headline)
                            .foregroundColor(Color.gray)
                        Text(viewModel.fromStation)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }.offset(x: 10.0, y: 20)
                    HStack{
                        Rectangle()
                            .foregroundColor(.gray)
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
                        })
                    }
                    VStack(alignment: .leading){
                        Text("To")
                            .font(.headline)
                            .foregroundColor(Color.gray)
                        Text(viewModel.toStation)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }.offset(x: 10.0, y: -20)
                }
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(30.0)
                .padding()
                HStack{
                    Button(action: {
                        print("Info")
                    }, label: {
                        Image(systemName: "exclamationmark.circle")
                            .font(.title)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.init(#colorLiteral(red: 0.8515912294, green: 0.8465295434, blue: 0.8554823995, alpha: 1)))
                            .cornerRadius(10)
                    })
                    NavigationLink(
                        destination: SelectSeatView(),
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
                }
                Spacer()
                ZStack{
                    Image("mask")
                        .resizable()
                        .scaledToFill()
                    VStack(alignment: .leading){
                        Text("KERETO")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Stay Save")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("Use your mask!")
                                .font(.headline)
                        }.padding([.leading, .bottom])
                        
                        ZStack{
                            Rectangle()
                                .stroke(Color.white.opacity(0))
                                .background(Blur(style: .systemUltraThinMaterial))
                                .frame(height: 50)
                            Link(destination: URL(string: "https://www.apple.com")!, label: {
                                Text("Learn more")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                            })
                        }
                    }
                }
                .mask(RoundedRectangle(cornerRadius: 30))
                .frame(height: 200)
                .padding()
                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarTitle("Destination")
            .background(Color.init(#colorLiteral(red: 0.9379398227, green: 0.9422804713, blue: 0.9528906941, alpha: 1)))
            .edgesIgnoringSafeArea([.bottom, .top])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TrainViewModel())
    }
}
