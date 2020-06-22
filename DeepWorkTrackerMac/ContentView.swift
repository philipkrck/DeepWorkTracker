//
//  ContentView.swift
//  DeepWorkTrackerMac
//
//  Created by Philip Krück on 22.06.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Prepare Session View")
                .tabItem {
//                    Image(systemName: "timer")
                    Text("Start")
                }
            
            Text("Prepare Session View")
                .tabItem {
//                    Image(systemName: "list.dash")
                    Text("Sessions")
                }
            
            Text("Prepare Session View")
                .tabItem {
//                    Image(systemName: "chart.pie")
                    Text("Analytics")

                    
                }
            
            Text("Prepare Session View")
                .tabItem {
//                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
