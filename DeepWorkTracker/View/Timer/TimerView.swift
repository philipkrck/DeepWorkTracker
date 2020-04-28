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
    
    @State var duration: TimeInterval
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let category: Category_Old
    
    var body: some View {
        NavigationView {
            VStack {
                Text(duration.formattedDigitalTime)
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
                guard self.duration > 0 else {
                    self.timer.upstream.connect().cancel()
                    self.saveSession()
                    self.presentationMode.wrappedValue.dismiss()
                    return
                }
                self.duration -= 1
            })
        }
    }
    
    private func saveSession() {
        let session = Session(context: managedObjectContext)
        session.id = UUID()
        session.date = Date()
        session.duration = duration
        
        try? managedObjectContext.save()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(duration: 60*60 + 43, category: Category_Old(name: "Default", color: .red))
    }
}
