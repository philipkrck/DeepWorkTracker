//
//  EditSessionView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct EditSessionView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    let session: Session
    
    @State private var date: Date = Date()
    @State private var duration: TimeInterval = 0
    @State private var showingDeleteAlert = false
    
    @State var category: Category
    
    var body: some View {
        ConfigureSessionView(date: $date, selectedDuration: $duration, selectedCategory: $category)
            .navigationBarTitle(Text("Edit Session"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showingDeleteAlert = true
            }) {
                Image(systemName: "trash")
            })
            .alert(isPresented: $showingDeleteAlert) { () -> Alert in
                Alert(title: Text("Delete session"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")) {
                        self.deleteSession()
                    }, secondaryButton: .cancel())
            }
            .onAppear {
                self.date = self.session.wrappedDate
                self.duration = self.session.duration
                self.category = self.session.wrappedCategory
            }
        
        // ToDo: Save edited session
    }
    
    private func deleteSession() {
        managedObjectContext.delete(session)
        managedObjectContext.saveIfChanges()
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditSessionView_Previews: PreviewProvider {
    static var previews: some View {
        EditSessionView(session: Session(), category: Category.mockCategory)
    }
}
