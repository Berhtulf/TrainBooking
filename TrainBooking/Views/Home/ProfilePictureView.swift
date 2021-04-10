//
//  ProfilePictureView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 10.04.2021.
//

import SwiftUI

struct ProfilePictureView: View {
    var body: some View {
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
}


struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView()
    }
}
