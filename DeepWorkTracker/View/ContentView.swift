//
//  ContentView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 13.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PrepareSessionView()
                .tabItem {
                    Image(systemName: "timer")
                    Text("Start")
                }
            
            SessionOverviewView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Sessions")
                }
            
            Text("Analytics")
                .tabItem {
                    Image(systemName: "chart.pie")
                    Text("Analytics")
                }
            
            Text("Settings")
                .tabItem {
                    Image(systemName: "gear")
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
