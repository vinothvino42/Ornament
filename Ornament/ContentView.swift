//
//  ContentView.swift
//  Ornament
//
//  Created by Vinoth Vino on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        OrnamentEx1()
//        OrnamentEx2()
    }
}

struct OrnamentEx1: View {
    @State private var showHideOrnament: Visibility = .visible
    @State private var placement: UnitPoint = .topLeading
    @State private var anchors: [UnitPoint] = [.top, .topTrailing, .leading, .center, .trailing, .bottomLeading, .bottom, .bottomTrailing, .topLeading]
    
    var body: some View {
        VStack(spacing: 26) {
            Text("visionOS Ornament")
            VStack(spacing: 20) {
                Button("Show / Hide Ornament") {
                    showHideOrnament = showHideOrnament == .visible ? .hidden : .visible
                }
                
                Button("Change Placement") {
                    let removedItem = anchors.removeFirst()
                    placement = removedItem
                    anchors.append(removedItem)
                }
            }
        }
            .ornament(visibility: showHideOrnament, attachmentAnchor: .scene(placement)) {
                HStack(spacing: 20) {
                    Button("Home", systemImage: "house") {
                        
                    }
                    
                    Button("Search", systemImage: "magnifyingglass") {
                        
                    }
                }
                .labelStyle(.iconOnly)
                .padding(.all)
                .glassBackgroundEffect()
            }
    }
}

struct OrnamentEx2: View {
    var body: some View {
        Text("visionOS Ornament")
            .toolbar {
                ToolbarItem(placement: .bottomOrnament) {
                    Button("Home", systemImage: "house") {
                        
                    }
                }
                
                ToolbarItem(placement: .bottomOrnament) {
                    Button("Search", systemImage: "magnifyingglass") {
                        
                    }
                }
                
                ToolbarItem(placement: .bottomOrnament) {
                    Button("Chat", systemImage: "message") {
                        
                    }
                }
                
                ToolbarItem(placement: .bottomOrnament) {
                    Button("Account", systemImage: "person") {
                        
                    }
                }
            }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
