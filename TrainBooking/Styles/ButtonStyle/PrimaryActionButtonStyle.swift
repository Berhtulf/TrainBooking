//
//  PrimaryActionButtonStyle.swift
//  TrainBooking
//
//  Created by Martin Václavík on 10.04.2021.
//

import SwiftUI

struct PrimaryActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(Color.yellow)
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.3 : 1)
    }
}

struct PrimaryActionButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("Button pressed")
        }, label: {
            Text("Button")
        }).buttonStyle(PrimaryActionButtonStyle())
    }
}
