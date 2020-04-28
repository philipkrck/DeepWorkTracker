//
//  EditSessionView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct EditSessionView: View {
    @State private var startDate = Date()
    
    var body: some View {
        Form {
            DatePicker("Start date: ", selection: $startDate, displayedComponents: .date)
            
            NavigationLink(destination: SetDurationView(timeInterval: .constant(200))) {
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
        .navigationBarTitle(Text("Edit Session"), displayMode: .inline)
    }
}

struct EditSessionView_Previews: PreviewProvider {
    static var previews: some View {
        EditSessionView()
    }
}
