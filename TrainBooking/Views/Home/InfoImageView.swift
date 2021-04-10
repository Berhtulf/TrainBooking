//
//  InfoImageView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 10.04.2021.
//

import SwiftUI

struct InfoImageView: View {
    var body: some View {
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
                }.padding()
                
                ZStack{
                    Rectangle()
                        .stroke(Color.white.opacity(0))
                        .background(Blur(style: .systemUltraThinMaterial))
                        .frame(height: 50)
                    Link(destination: URL(string: "http://vaclavik-dev.maweb.eu")!, label: {
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
    }
}


struct InfoImageView_Previews: PreviewProvider {
    static var previews: some View {
        InfoImageView()
    }
}
