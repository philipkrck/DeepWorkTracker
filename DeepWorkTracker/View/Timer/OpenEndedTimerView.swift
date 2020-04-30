//
//  TimerView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI
import FoundationExtensions
import CoreData

struct OpenEndedTimerView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var timeSinceStart: TimeInterval = 0
    
    let category: Category
    
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
                    Text(category.wrappedName)
                }
            }
            .navigationBarTitle("Deep Work")
            .navigationBarItems(trailing:
                Button("Save") {
                    self.showNotification()
                    self.saveSession()
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
        .onReceive(timer) { time in
            self.timeSinceStart += 1
        }
    }
    
    private func showNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Deep work session complete!"
        content.subtitle = "You just worked \(timeSinceStart.formattedSpokenTime)"
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
    private func saveSession() {
        let session = Session(context: managedObjectContext)
        session.date = Date()
        session.duration = timeSinceStart
        session.category = category
        
        managedObjectContext.saveIfChanges()
    }
}

struct OpenEndedTimerView_Previews: PreviewProvider {
    static var previews: some View {
        OpenEndedTimerView(category: Category.mockCategory)
    }
}
