//
//  CategoryView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct Category: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var color: Color
}

extension Category {
    static var defaults = [Category(name: "Default", color: .red), Category(name: "Learn SwiftUI", color: .orange), Category(name: "CS Degree", color: .purple)]
}

struct ChooseCategoryView: View {
    
    @Binding var selectedCategoryIndex: Int
    @State private var showingAddCategoryView = false
    
    var body: some View {
        Form {
            ForEach(0..<Category.defaults.count) { categoryIndex in
                HStack {
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundColor(Category.defaults[categoryIndex].color)
                    Text(Category.defaults[categoryIndex].name)
                    Spacer()
                    
                    if categoryIndex == self.selectedCategoryIndex {
                        Image(systemName: "checkmark")
                            .foregroundColor(Category.defaults[categoryIndex].color)
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
        ChooseCategoryView(selectedCategoryIndex: .constant(0))
    }
}
