//
//  ContentView.swift
//  DeepWorkTrackerWatch Extension
//
//  Created by Philip Krück on 21.06.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sessionTypes: [SessionType] = [.openEnded, .timer]
    @State private var sessionTypeIndex = 0
    @State private var showingTimerView = false
    
    var body: some View {
        Form {
            Picker("", selection: $sessionTypeIndex.animation()) {
                ForEach(0..<sessionTypes.count) {
                    Text("\(self.sessionTypes[$0].rawValue)")
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            Button("Start Session") {
                self.showingTimerView = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
