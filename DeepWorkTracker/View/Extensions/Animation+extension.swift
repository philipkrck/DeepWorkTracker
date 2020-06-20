//
//  Animation+extension.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 20.06.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int, speedFactor: Double = 1) -> Animation {
        Animation.spring(dampingFraction: 0.15 + speedFactor * 0.1)
            .speed(2 * speedFactor)
            .delay(0.03 * Double(index))
    }
}
