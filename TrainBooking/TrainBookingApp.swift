//
//  TrainBookingApp.swift
//  TrainBooking
//
//  Created by Martin Václavík on 05.04.2021.
//

import SwiftUI

@main
struct TrainBookingApp: App {
    @StateObject var model = TrainViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(model)
        }
    }
}
