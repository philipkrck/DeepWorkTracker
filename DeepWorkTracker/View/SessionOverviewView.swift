//
//  SessionOverviewView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct Session: Identifiable {
    let id = UUID()
    let date: Date
    let totalTime: Time
    let category: Category
}

extension Session {
    static let sample = Session(date: Date(), totalTime: Time(hour: 1, minute: 10), category: Category(name: "Default", color: .red))
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

struct SessionOverviewView: View {
    let sessions: [Session] = [Session.sample]
    
    @State private var showingAddSessionView = false
    
    var body: some View {
        NavigationView {
            List(sessions) { session in
                NavigationLink(destination: EditSessionView()) {
                    HStack {
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(session.category.color)
                        VStack(alignment: .leading) {
                            Text(session.category.name)
                            Text(session.formattedDate)
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                        Spacer()
                        Text("50 mins")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationBarTitle("Completed Sessions")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddSessionView = true
                }) {
                    Image(systemName: "plus")
                })
            .sheet(isPresented: $showingAddSessionView) {
                AddSessionView()
            }
        }
    }
}

struct SessionOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        SessionOverviewView()
    }
}
