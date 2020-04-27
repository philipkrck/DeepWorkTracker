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
    @State private var sessionType = 0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Session Type")) {
                    Picker("One", selection: $sessionType.animation()) {
                        ForEach(0..<sessionTypes.count) {
                            Text("\(self.sessionTypes[$0].rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    if sessionType == 1 {
                        NavigationLink(destination: Text("To be added")) {
                            HStack {
                                Text("Set duration")
                                Spacer()
                                Text("50 min")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                Section(header: Text("Category")) {
                    NavigationLink(destination: Text("Choose category")) {
                        HStack {
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.red)
                            Text("Choose Category")
                            Spacer()
                            Text("Default")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Button("Start Session") {
                    print("Start session")
                }

            }
            .navigationBarTitle("Prepare session")
        }
    }
}

struct PrepareSessionView_Previews: PreviewProvider {
    static var previews: some View {
        PrepareSessionView()
    }
}
