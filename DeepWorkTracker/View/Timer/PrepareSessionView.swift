//
//  PrepareSessionView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct PrepareSessionView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Category.entity(), sortDescriptors: []) var categories: FetchedResults<Category>
    
    @State private var sessionTypes: [SessionType] = [.openEnded, .timer]
    @State private var sessionTypeIndex = 0
    @State private var showingTimerView = false
    
    @State private var selectedDuration: TimeInterval = 50 * 60
    @State var selectedCategory: Category

    private var sessionType: SessionType {
        sessionTypes[sessionTypeIndex]
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Session Type")) {
                    Picker("", selection: $sessionTypeIndex.animation()) {
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
                                Text(selectedDuration.formattedSpokenTime)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                Section(header: Text("Category")) {
                    NavigationLink(destination: ChooseCategoryView(selectedCategory: $selectedCategory).environment(\.managedObjectContext, managedObjectContext)) {
                        HStack {
                            Text("Choose Category")
                            Spacer()
                            HStack {
                                Circle()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(selectedCategory.color)
                            }
                            Text(selectedCategory.wrappedName)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Button("Start Session") {
                    self.hapticFeedback()
                    self.showingTimerView = true
                }
            }
            .navigationBarTitle("Prepare session")
            .sheet(isPresented: $showingTimerView) {
                self.sessionType == .openEnded
                    ? AnyView(OpenEndedTimerView(category: self.selectedCategory).environment(\.managedObjectContext, self.managedObjectContext))
                    : AnyView(TimerView(duration: self.selectedDuration, category: self.selectedCategory).environment(\.managedObjectContext, self.managedObjectContext))
            }
        }
    }
    
    private func hapticFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

struct PrepareSessionView_Previews: PreviewProvider {
    static var previews: some View {
        PrepareSessionView(selectedCategory: Category.mockCategory)
    }
}
