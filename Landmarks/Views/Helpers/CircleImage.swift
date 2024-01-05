//
//  CircleImage.swift
//  Landmarks
//
//  Created by Hakan on 21.12.23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 10)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
