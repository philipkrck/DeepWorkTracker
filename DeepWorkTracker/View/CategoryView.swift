//
//  CategoryView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    var name: String
    var color: Color
}

struct CategoryView: View {
    var categories = [Category(name: "Default", color: .red), Category(name: "Learn SwiftUI", color: .orange), Category(name: "CS Degree", color: .purple)]
    
    @State private var selectedCategoryIndex = 0
    @State private var showingAddCategoryView = false
    
    var body: some View {
        Form {
            ForEach(0..<categories.count) { categoryIndex in
                HStack {
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundColor(self.categories[categoryIndex].color)
                    Text(self.categories[categoryIndex].name)
                    Spacer()
                    
                    if categoryIndex == self.selectedCategoryIndex {
                        Image(systemName: "checkmark")
                            .foregroundColor(self.categories[categoryIndex].color)
                            .frame(width: 16, height: 16)
                    }
                }
                .onTapGesture {
                    print("category \(categoryIndex)")
                    self.selectedCategoryIndex = categoryIndex
                }
            }
            .onDelete(perform: removeItems)
        }
        .navigationBarTitle("Choose category", displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                self.showingAddCategoryView = true
            }) {
                Image(systemName: "plus")
            })
        .sheet(isPresented: $showingAddCategoryView) {
            AddCategoryView()
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        // ...
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
