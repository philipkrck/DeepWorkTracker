//
//  SetDurationView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct SetDurationView: View {
    @Binding var timeInterval: TimeInterval
    
    var body: some View {
        VStack {
            // TODO: replace this picker with a native SwiftUI picker
            DurationPickerView(timeInterval: $timeInterval)
            Spacer()
        }
        .navigationBarTitle(Text("Set duration"), displayMode: .inline)
    }
}

struct SetDurationView_Previews: PreviewProvider {
    static var previews: some View {
        SetDurationView(timeInterval: .constant(3600))
    }
}
