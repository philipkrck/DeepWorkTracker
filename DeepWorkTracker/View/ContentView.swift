//
//  ContentView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 13.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    let defaultCategory: Category
    
    var body: some View {
        TabView {
            PrepareSessionView(selectedCategory: defaultCategory)
                .tabItem {
                    Image(systemName: "timer")
                    Text("Start")
                }
            
            SessionOverviewView(selectedCategory: defaultCategory)
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
        .onAppear {
            // request notification permission // ToDo: think of more subtle logic than on appear
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("All set!")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(defaultCategory: Category.mockCategory)
    }
}
