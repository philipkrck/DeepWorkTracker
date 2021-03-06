//
//  ConfigureSessionView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 29.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct ConfigureSessionView: View {
    @Binding var date: Date
    @Binding var selectedDuration: TimeInterval
    @Binding var selectedCategory: Category
    
    var body: some View {
        Form {
            DatePicker("Choose date: ", selection: $date, displayedComponents: .date)
            
            NavigationLink(destination: SetDurationView(timeInterval: $selectedDuration)) {
                HStack {
                    Text("Set duration")
                    Spacer()
                    Text(selectedDuration.formattedSpokenTime)
                        .foregroundColor(.secondary)
                }
            }
        
        
            NavigationLink(destination: ChooseCategoryView(selectedCategory: $selectedCategory)) {
                HStack {
                    Text("Choose Category")
                    Spacer()
                    HStack {
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(selectedCategory.color)
                    }
                    Text(selectedCategory.wrappedName)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct ConfigureSessionView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigureSessionView(date: .constant(Date()), selectedDuration: .constant(3000), selectedCategory: .constant(Category.mockCategory))
    }
}
