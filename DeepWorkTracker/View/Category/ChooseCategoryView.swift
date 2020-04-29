//
//  CategoryView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct Category_Old: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var color: Color
}

extension Category_Old {
    static var defaults = [Category_Old(name: "Default", color: .red), Category_Old(name: "Learn SwiftUI", color: .orange), Category_Old(name: "CS Degree", color: .purple)]
}

struct ChooseCategoryView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Category.entity(), sortDescriptors: []) var categories: FetchedResults<Category> // todo: add sort descriptor
    
    @Binding var selectedCategory: Category
    @State private var showingAddCategoryView = false
    
    var body: some View {
        Form {
            ForEach(categories, id: \.self) { category in
                HStack {
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundColor(category.color)
                    Text(category.wrappedName)
                    Spacer()
                    
                    if category == self.selectedCategory {
                        Image(systemName: "checkmark")
                            .foregroundColor(category.color)
                            .frame(width: 16, height: 16)
                    }
                }
                .onTapGesture {
                    self.selectedCategory = category
                    // todo: dismiss view
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
            AddCategoryView().environment(\.managedObjectContext, self.managedObjectContext)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        // ...
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseCategoryView(selectedCategory: .constant(Category()))
    }
}
