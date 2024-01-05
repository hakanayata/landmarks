//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Hakan on 28.12.23.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            // Display the categories in Landmarks using a List
            List {
//                modelData.features[0].image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 200)
//                    .clipped()
//                // Extend content to the edges of the display
//                    .listRowInsets(EdgeInsets())
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
                // Set the title of the navigation bar to Featured
                .navigationTitle("Featured")
                .toolbar {
                                Button {
                                    showingProfile.toggle()
                                } label: {
                                    Label("User Profile", systemImage: "person.crop.circle")
                                }
                            }
                            .sheet(isPresented: $showingProfile) {
                                ProfileHost()
                                    .environment(modelData)
                            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
