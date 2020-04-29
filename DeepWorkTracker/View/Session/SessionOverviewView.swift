//
//  SessionOverviewView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

// TODO: remove and replace with Core Data model
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
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Session.entity(), sortDescriptors: []) var sessions: FetchedResults<Session>
    
    @State private var showingAddSessionView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sessions, id: \.self) { session in
                    NavigationLink(destination: EditSessionView()) {
                        HStack {
                            Circle()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.red) // todo: add color from category
                            VStack(alignment: .leading) {
                                Text("Category name") // todo: add name from category
                                Text(session.date?.formatted ?? "") // todo: add formatted date
                                    .foregroundColor(.secondary)
                                    .font(.caption)
                            }
                            Spacer()
                            Text(session.duration.formattedSpokenTime)
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
                AddSessionView().environment(\.managedObjectContext, self.managedObjectContext)
            }
        }
    }
    
    private func removeSession(at offsets: IndexSet) {
        for offset in offsets {
            let session = sessions[offset]
            managedObjectContext.delete(session)
        }
        self.managedObjectContext.saveIfChanges()
    }
}

struct SessionOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        SessionOverviewView()
    }
}

extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: self)
    }
}
