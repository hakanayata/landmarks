//
//  Landmark.swift
//  Landmarks
//
//  Created by Hakan on 22.12.23.
//

import Foundation
import SwiftUI
import CoreLocation

// Define a Landmark structure matching the keys in the landmarkData.json
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    // Private because users care only about the image itself
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    // Private because we'll use it only to create a public computed property; locationCoordinate
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
