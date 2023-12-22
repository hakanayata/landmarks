//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Hakan on 21.12.23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    // Create a model instance
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                // Supply a model instance to ContentView using the environment(_:) modifier
                .environment(modelData)
        }
    }
}
