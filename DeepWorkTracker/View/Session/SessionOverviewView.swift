//
//  SessionOverviewView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

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
                                .foregroundColor(session.category?.color ?? .gray) // todo: add color from category
                            VStack(alignment: .leading) {
                                Text(session.category?.wrappedName ?? "Missing category name") // todo: add name from category
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
        managedObjectContext.saveIfChanges()
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
