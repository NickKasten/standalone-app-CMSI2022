//
//  Cool_DestinationsApp.swift
//  Cool Destinations
//
//  Created by Nick Kasten on 1/23/23.
//

import SwiftUI

@main

struct Cool_DestinationsApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(modelData)
        }
    }
}
