//
//  AddSessionView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct AddSessionView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var date = Date()
    
    @State private var selectedDuration: TimeInterval = 3600 * 50
    
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
                    // todo: create new session
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

struct AddSessionView_Previews: PreviewProvider {
    static var previews: some View {
        AddSessionView()
    }
}
