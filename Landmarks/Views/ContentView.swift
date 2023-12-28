//
//  ContentView.swift
//  Landmarks
//
//  Created by Hakan on 21.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)


            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            }
    }
}

#Preview {
    ContentView()
        // Add the model object to the environment, which makes the obj available to any subview
        .environment(ModelData())
}
