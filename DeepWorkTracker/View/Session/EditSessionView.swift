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
    @State private var duration: TimeInterval = 3000
    
    var body: some View {
        ConfigureSessionView(date: $startDate, selectedDuration: $duration)
            .navigationBarTitle(Text("Edit Session"), displayMode: .inline)
    }
}

struct EditSessionView_Previews: PreviewProvider {
    static var previews: some View {
        EditSessionView()
    }
}
