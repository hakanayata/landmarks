//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Hakan on 22.12.23.
//

import SwiftUI

struct LandmarkList: View {
    // Add an @Environment property
    // We use @Environment property in views that are lower down in the view hierarchy to receive data from views that are higher up)
    @Environment(ModelData.self) var modelData
    // Add  a @State property called show
    @State private var showFavoritesOnly = false
    
    // Compute a filtered version of the landmarks list by checking the showFavOnly property and each landmark.isFavorite value
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
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
            List {
                // Passing a binding to show FavoritesOnly
                // Use the $ prefix to access a binding to a state variable, or one of its properties
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                // To combine static and dynamic views in a list, or to combine 2 or more different groups of dynamic views,
                // use the ForEach type instead of passing your collection of data to List
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            // Filtering animation with animation modifiler
            .animation(.default, value: filteredLandmarks)
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
        // We use this modifier so that views further down in the view hierarchy can read data objects passed down through the environment
        .environment(ModelData())
}
