//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Hakan on 22.12.23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // Static way of listing landmarks
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
        // Dynamic way of listing landmarks (like .map in JS)
        // This creates one LandmarkRow for each element in the landmarks array
        // id is like a key={} in React, we can either pass it along with our data
        // or add Identifiable protocol (see 4 lines below)
//        List(landmarks, id: \.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        
        NavigationSplitView {
            // After adding Identifiable protocol to Landmark struct we don't need id here anymore
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            // modifier to set the title of the navigation bar
            .navigationTitle("Landmarks")
            
        } detail: {
            // placeholder for iPad
            Text("Select a Landmark")
        }

    }
}

#Preview {
    LandmarkList()
}
