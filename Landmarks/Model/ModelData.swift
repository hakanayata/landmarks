//
//  ModelData.swift
//  Landmarks
//
//  Created by Hakan on 22.12.23.
//

import Foundation

// Create an array of landmarks initialized from landmarkData.json
var landmarks: [Landmark] = load("landmarkData.json")

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
