//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by Hakan on 26.12.23.
//

import CoreGraphics

struct HexagonParameters {
    // Define a segment structure to hold the three points that represent one side of the hexagon
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
}
