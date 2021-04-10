//
//  TrainBookingApp.swift
//  TrainBooking
//
//  Created by Martin Václavík on 05.04.2021.
//

import SwiftUI

@main
struct TrainBookingApp: App {
    @StateObject var viewModel = TrainViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.light)
                .environmentObject(viewModel)
        }
    }
}
