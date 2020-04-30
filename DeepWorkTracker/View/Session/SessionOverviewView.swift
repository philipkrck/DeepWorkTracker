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
    let selectedCategory: Category
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sessions, id: \.self) { session in
                    NavigationLink(destination: EditSessionView()) {
                        HStack {
                            Circle()
                                .frame(width: 16, height: 16)
                                .foregroundColor(session.category?.color ?? .gray)
                            
                            VStack(alignment: .leading) {
                                Text(session.category?.wrappedName ?? "Missing category name")
                                Text(session.date?.formatted ?? "")
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
                AddSessionView(selectedCategory: self.selectedCategory).environment(\.managedObjectContext, self.managedObjectContext)
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
        SessionOverviewView(selectedCategory: Category.mockCategory)
    }
}

extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: self)
    }
}
