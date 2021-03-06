//
//  CategoryView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct ChooseCategoryView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @FetchRequest(entity: Category.entity(), sortDescriptors: []) var categories: FetchedResults<Category> // todo: add sort descriptor
    
    @Binding var selectedCategory: Category
    @State private var showingAddCategoryView = false
    
    var body: some View {
        Form {
            ForEach(categories, id: \.self) { category in
                Button(action: {
                    self.selectedCategory = category
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    HStack {
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(category.color)
                        Text(category.wrappedName)
                            .foregroundColor(.primary)
                        Spacer()
                        
                        if category == self.selectedCategory {
                            Image(systemName: "checkmark")
                                .foregroundColor(category.color)
                                .frame(width: 16, height: 16)
                        }
                    }
                }
            }
            .onDelete(perform: removeCategories)
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
    
    func removeCategories(at offsets: IndexSet) {
        for offset in offsets {
            let category = categories[offset]
            managedObjectContext.delete(category)
        }
        managedObjectContext.saveIfChanges()
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseCategoryView(selectedCategory: .constant(Category.mockCategory))
    }
}
