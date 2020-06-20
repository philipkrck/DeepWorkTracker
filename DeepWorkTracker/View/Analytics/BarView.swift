//
//  BarView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 20.06.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct BarView: View {
    
    let height: CGFloat = 200
    var width: CGFloat = 30
    var percentageFill: CGFloat
    
    var body: some View {
        Capsule()
            .frame(width: width, height: 200 * percentageFill)
            .foregroundColor(.primary)
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(percentageFill: 0.5)
    }
}
