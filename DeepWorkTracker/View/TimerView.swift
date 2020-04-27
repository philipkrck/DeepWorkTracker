//
//  TimerView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text("Presenting a timer")
            .font(.largeTitle)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
