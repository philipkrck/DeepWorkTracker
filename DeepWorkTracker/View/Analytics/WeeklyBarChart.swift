//
//  WeeklyBarChart.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 20.06.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

struct DayDataPoint: Hashable {
    let weekday: Weekday.RawValue
    let minutesWorked: Int
    
    enum Weekday: String {
        case monday = "Mo"
        case tuesday = "Tu"
        case wednesday = "We"
        case thursday = "Th"
        case friday = "Fr"
        case saturday = "Sa"
        case sunday = "Su"
    }
}

struct WeeklyBarChart: View {
    
    @State private var weeklyData = [
        DayDataPoint(weekday: DayDataPoint.Weekday.monday.rawValue, minutesWorked: 244),
        DayDataPoint(weekday: DayDataPoint.Weekday.tuesday.rawValue, minutesWorked: 100),
        DayDataPoint(weekday: DayDataPoint.Weekday.wednesday.rawValue, minutesWorked: 280),
        DayDataPoint(weekday: DayDataPoint.Weekday.thursday.rawValue, minutesWorked: 150),
        DayDataPoint(weekday: DayDataPoint.Weekday.friday.rawValue, minutesWorked: 90),
        DayDataPoint(weekday: DayDataPoint.Weekday.saturday.rawValue, minutesWorked: 50),
        DayDataPoint(weekday: DayDataPoint.Weekday.sunday.rawValue, minutesWorked: 130)
    ]
    
    private var maxMinutesWorked: Int = 280
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 16) {
            ForEach(weeklyData, id: \.self) { dataPoint in
                VStack {
                    BarView(percentageFill: CGFloat(dataPoint.minutesWorked) / CGFloat(self.maxMinutesWorked))
                    Text(dataPoint.weekday)
                }
            }
        }
    }
}

struct WeeklyBarChart_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyBarChart()
    }
}
