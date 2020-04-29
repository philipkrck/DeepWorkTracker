//
//  TimerView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 28.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    let duration: TimeInterval
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let category: Category_Old
    
    @State private var timeIntervalSinceStart: TimeInterval = 0
    
    var remainingDuration: TimeInterval {
        duration - timeIntervalSinceStart
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(remainingDuration.formattedDigitalTime)
                    .font(.largeTitle)
                HStack {
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundColor(category.color)
                    Text(category.name)
                }
            }
            .navigationBarTitle("Deep Work")
            .onReceive(timer, perform: { time in
                guard self.timeIntervalSinceStart != self.duration else {
                    self.timer.upstream.connect().cancel()
                    self.saveSession()
                    self.presentationMode.wrappedValue.dismiss()
                    return
                }
                self.timeIntervalSinceStart += 1
            })
        }
    }
    
    private func saveSession() {
        let session = Session(context: managedObjectContext)
        session.date = Date()
        session.duration = duration
        // todo: add category
        
        try? managedObjectContext.save()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(duration: 60*60 + 43, category: Category_Old(name: "Default", color: .red))
    }
}
