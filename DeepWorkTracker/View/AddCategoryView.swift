//
//  AddCategoryView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct AddCategoryView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let colors: [Color] = [.red, .green, .blue, .black, .gray, .orange, .yellow, .purple, .pink]
    
    @State private var color = Color.red
    @State private var categoryName = ""
    @State private var showingAlert = false
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Category name", text: $categoryName) // todo: bound input to x characters
                
                Picker("Color", selection: $color) {
                    ForEach(colors, id: \.self) { color in
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(color)
                    }
                }
            }
            .navigationBarTitle("Add a new category")
            .navigationBarItems(trailing:
                Button("Save") {
                    guard !self.categoryName.isEmpty else { // todo: also check for white spaces
                        self.showingAlert = true
                        return
                    }
                    
                    // todo: create new category
                    self.presentationMode.wrappedValue.dismiss()
                }
                
            )
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Please enter a category name"), dismissButton: .default(Text("OK")))
        }
    }
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView()
    }
}
