//
//  SessionOverviewView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct Session_Old: Identifiable {
    let id = UUID()
    let date: Date
    let totalTime: Time
    let category: Category_Old
}

extension Session_Old {
    static let sample = Session_Old(date: Date(), totalTime: Time(hour: 1, minute: 10), category: Category_Old(name: "Default", color: .red))
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

struct SessionOverviewView: View {
    var sessions: [Session_Old] = [Session_Old.sample]
    
    @State private var showingAddSessionView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sessions, id: \.id) { session in
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
                .onDelete(perform: removeSession)
            }
            .navigationBarTitle("Completed Sessions")
            .navigationBarItems(leading: !sessions.isEmpty ? EditButton(): nil, trailing:
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
    
    private func removeSession(at offsets: IndexSet) {
        // todo: remove sessions
    }
}

struct SessionOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        SessionOverviewView()
    }
}
