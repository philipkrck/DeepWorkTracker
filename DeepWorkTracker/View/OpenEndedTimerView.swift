//
//  TimerView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI
import FoundationExtensions

struct OpenEndedTimerView: View {
    @Environment(\.presentationMode) var presentationMode
    var duration: TimeInterval
    
    
    var body: some View {
        Text(duration.formattedDigitalTime)
            .font(.largeTitle)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        OpenEndedTimerView(duration: 60*60)
    }
}
