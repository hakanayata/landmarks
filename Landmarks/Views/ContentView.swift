//
//  ContentView.swift
//  Landmarks
//
//  Created by Hakan on 21.12.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        // Add the model object to the environment, which makes the obj available to any subview
        .environment(ModelData())
}
