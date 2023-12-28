//
//  ModelData.swift
//  Landmarks
//
//  Created by Hakan on 22.12.23.
//

import Foundation

// Use observation for storage; Observable() macro
// With observation, a view in SwiftUI can support data changes without using property wrappers or bindings
// SwiftUI updates a view only when an observable property changes and the view's body reads the property directly
@Observable
class ModelData {
    // Create an array of landmarks initialized from landmarkData.json and load the landmarks into our model
    var landmarks: [Landmark] = load("landmarkData.json")
    // Create an array of hikes initialized from hikeData.json and load the hikes into our model
    var hikes: [Hike] = load("hikeData.json")
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}


// Fetch JSON data with a given name from the app's main bundle
// Load method relies on the return type's conformance to the Decodable protocol,
// which is one component of the Codable protocol
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in the bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Coulnd't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
