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
                    self.saveSession()
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
        .onReceive(timer) { time in
            self.timeSinceStart += 1
        }
    }
    
    private func saveSession() {
        let session = Session(context: managedObjectContext)
        session.date = Date()
        session.duration = timeSinceStart
        // todo: add category to session
        
        managedObjectContext.saveIfChanges()
    }
}

struct OpenEndedTimerView_Previews: PreviewProvider {
    static var previews: some View {
        OpenEndedTimerView(category: Category_Old(name: "Default", color: .red))
    }
}
