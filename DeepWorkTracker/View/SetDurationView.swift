//
//  SetDurationView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct SetDurationView: View {
    var body: some View {
        VStack {
            // TODO: replace this picker with a native SwiftUI picker
            DurationPickerView(time: .constant(Time(hour: 0, minute: 25)))
            Spacer()
        }
        .navigationBarTitle(Text("Set duration"), displayMode: .inline)
    }
}

struct SetDurationView_Previews: PreviewProvider {
    static var previews: some View {
        SetDurationView()
    }
}
