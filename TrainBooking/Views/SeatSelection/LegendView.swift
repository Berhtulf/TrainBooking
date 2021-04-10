//
//  LegendView.swift
//  TrainBooking
//
//  Created by Martin Václavík on 10.04.2021.
//

import SwiftUI

struct LegendView: View {
    var body: some View {
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
    }
}

struct LegendView_Previews: PreviewProvider {
    static var previews: some View {
        LegendView()
    }
}
