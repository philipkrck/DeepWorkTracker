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
    
    @State private var selectedDuration: TimeInterval = 50 * 60
    
    var body: some View {
        NavigationView {
            Form {
                DatePicker("date: ", selection: $date, displayedComponents: .date)
                
                NavigationLink(destination: SetDurationView(timeInterval: $selectedDuration)) {
                    HStack {
                        Text("Set duration")
                        Spacer()
                        Text("50 min")
                            .foregroundColor(.secondary)
                    }
                }
                
                
                NavigationLink(destination: ChooseCategoryView(selectedCategoryIndex: .constant(0))) {
                    HStack {
                        Text("Choose Category")
                        Spacer()
                        HStack {
                            Circle()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.red)
                        }
                        Text("Default")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationBarTitle("Record Session")
            .navigationBarItems(trailing:
                Button("Save") {
                    self.saveSession()
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
    
    func saveSession() {
        let session = Session(context: managedObjectContext)
        session.id = UUID()
        session.date = date
        session.duration = selectedDuration
        // todo: add category
        
        try? managedObjectContext.save()
    }
}

struct AddSessionView_Previews: PreviewProvider {
    static var previews: some View {
        AddSessionView()
    }
}
