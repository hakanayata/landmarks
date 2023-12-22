//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Hakan on 22.12.23.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}
//// #Preview -> Preview macro
//// We can give names to Preview macros: Preview("name") {..}
//// These names will show up in the top left corner of the canvas
//#Preview("Turtle Rock") {
//    LandmarkRow(landmark: landmarks[0])
//}
//
//// Add a second Preview macro for second element
//#Preview("Salmon") {
//    LandmarkRow(landmark: landmarks[1])
//}

// Group Preview macros (single collection view)
#Preview {
    // Update the LandmarkRow preview to work with the ModelData object
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
