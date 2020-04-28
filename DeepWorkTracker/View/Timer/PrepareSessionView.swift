//
//  PrepareSessionView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

enum SessionType: String {
    case openEnded = "Open Ended"
    case timer = "Timer"
}

struct PrepareSessionView: View {
    
    @State private var sessionTypes: [SessionType] = [.openEnded, .timer]
    @State private var sessionTypeIndex = 0
    @State private var showingTimerView = false
    
    @State private var selectedDuration: TimeInterval = 50 * 60
    
    private var sessionType: SessionType {
        sessionTypes[sessionTypeIndex]
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Session Type")) {
                    Picker("One", selection: $sessionTypeIndex.animation()) {
                        ForEach(0..<sessionTypes.count) {
                            Text("\(self.sessionTypes[$0].rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    if sessionType == .timer {
                        NavigationLink(destination: SetDurationView(timeInterval: $selectedDuration)) {
                            HStack {
                                Text("Set duration")
                                Spacer()
                                Text(selectedDuration.formattedDigitalTime)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                Section(header: Text("Category")) {
                    NavigationLink(destination: CategoryView()) {
                        HStack {
                            Text("Choose Category")
                            Spacer()
                            HStack {
                                Circle()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(.red)
                            }
                            Text("Default")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Button("Start Session") {
                    self.showingTimerView = true
                }
            }
            .navigationBarTitle("Prepare session")
            .sheet(isPresented: $showingTimerView) {
                self.sessionType == .openEnded
                    ? AnyView(OpenEndedTimerView(category: Category(name: "Default", color: .red)))
                    : AnyView(TimerView(duration: 5, category: Category(name: "Default", color: .red)))
            }
        }
    }
}

struct PrepareSessionView_Previews: PreviewProvider {
    static var previews: some View {
        PrepareSessionView()
    }
}
