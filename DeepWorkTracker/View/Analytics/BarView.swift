//
//  BarView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 20.06.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct BarView: View {
    let index: Int
    let height: CGFloat
    let actualMeasure: Int
    let maxMeasure: Int
    
    var barHeight: CGFloat {
        height * CGFloat(actualMeasure) / CGFloat(maxMeasure)
    }
    
    var body: some View {
        Capsule()
            .fill(Color.primary)
            .frame(height: barHeight)
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(index: 1, height: 200, actualMeasure: 100, maxMeasure: 200)
    }
}
