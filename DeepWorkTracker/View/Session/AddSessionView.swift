//
//  AddSessionView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct AddSessionView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var date = Date()
    @State private var selectedDuration: TimeInterval = 3000
    @State var selectedCategory: Category
    
    var body: some View {
        NavigationView {
            ConfigureSessionView(date: $date, selectedDuration: $selectedDuration, selectedCategory: $selectedCategory)
                .navigationBarTitle("Record Session")
                .navigationBarItems(trailing:
                    Button("Save") {
                        self.hapticFeedback()
                        self.saveSession()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                )
        }
    }
    
    private func hapticFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    private func saveSession() {
        let session = Session(context: managedObjectContext)
        session.date = date
        session.duration = selectedDuration
        session.category = selectedCategory
        
        managedObjectContext.saveIfChanges()
    }
}

struct AddSessionView_Previews: PreviewProvider {
    static var previews: some View {
        AddSessionView(selectedCategory: Category.mockCategory)
    }
}
