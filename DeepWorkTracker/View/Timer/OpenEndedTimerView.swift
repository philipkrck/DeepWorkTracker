//
//  TimerView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI
import FoundationExtensions

struct OpenEndedTimerView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var timeSinceStart: TimeInterval = 0
    let category: Category_Old
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(timeSinceStart.formattedDigitalTime)
                    .font(.largeTitle)
                HStack {
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundColor(category.color)
                    Text(category.name)
                }
            }
            .navigationBarTitle("Deep Work")
            .navigationBarItems(trailing:
                Button("Save") {
                    // todo: save the session
                    print("saving session")
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
        .onReceive(timer) { time in
            self.timeSinceStart += 1
        }
    }
}

struct OpenEndedTimerView_Previews: PreviewProvider {
    static var previews: some View {
        OpenEndedTimerView(category: Category_Old(name: "Default", color: .red))
    }
}
