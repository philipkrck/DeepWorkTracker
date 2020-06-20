//
//  MonthlyBarChart.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 20.06.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//
import SwiftUI

struct MonthlyBarChart: View {
    @State private var monthlyData = [
        DayDataPoint(weekday: DayDataPoint.Weekday.monday.rawValue, minutesWorked: 244),
        DayDataPoint(weekday: DayDataPoint.Weekday.tuesday.rawValue, minutesWorked: 100),
        DayDataPoint(weekday: DayDataPoint.Weekday.wednesday.rawValue, minutesWorked: 280),
        DayDataPoint(weekday: DayDataPoint.Weekday.thursday.rawValue, minutesWorked: 150),
        DayDataPoint(weekday: DayDataPoint.Weekday.friday.rawValue, minutesWorked: 90),
        DayDataPoint(weekday: DayDataPoint.Weekday.saturday.rawValue, minutesWorked: 50),
        DayDataPoint(weekday: DayDataPoint.Weekday.sunday.rawValue, minutesWorked: 130),
        DayDataPoint(weekday: DayDataPoint.Weekday.monday.rawValue, minutesWorked: 244),
        DayDataPoint(weekday: DayDataPoint.Weekday.tuesday.rawValue, minutesWorked: 100),
        DayDataPoint(weekday: DayDataPoint.Weekday.wednesday.rawValue, minutesWorked: 280),
        DayDataPoint(weekday: DayDataPoint.Weekday.thursday.rawValue, minutesWorked: 150),
        DayDataPoint(weekday: DayDataPoint.Weekday.friday.rawValue, minutesWorked: 90),
        DayDataPoint(weekday: DayDataPoint.Weekday.saturday.rawValue, minutesWorked: 50),
        DayDataPoint(weekday: DayDataPoint.Weekday.sunday.rawValue, minutesWorked: 130),
        DayDataPoint(weekday: DayDataPoint.Weekday.monday.rawValue, minutesWorked: 244),
        DayDataPoint(weekday: DayDataPoint.Weekday.tuesday.rawValue, minutesWorked: 100),
        DayDataPoint(weekday: DayDataPoint.Weekday.wednesday.rawValue, minutesWorked: 280),
        DayDataPoint(weekday: DayDataPoint.Weekday.thursday.rawValue, minutesWorked: 150),
        DayDataPoint(weekday: DayDataPoint.Weekday.friday.rawValue, minutesWorked: 90),
        DayDataPoint(weekday: DayDataPoint.Weekday.saturday.rawValue, minutesWorked: 50),
        DayDataPoint(weekday: DayDataPoint.Weekday.sunday.rawValue, minutesWorked: 130),
        DayDataPoint(weekday: DayDataPoint.Weekday.monday.rawValue, minutesWorked: 244),
        DayDataPoint(weekday: DayDataPoint.Weekday.tuesday.rawValue, minutesWorked: 100),
        DayDataPoint(weekday: DayDataPoint.Weekday.wednesday.rawValue, minutesWorked: 280),
        DayDataPoint(weekday: DayDataPoint.Weekday.thursday.rawValue, minutesWorked: 150),
        DayDataPoint(weekday: DayDataPoint.Weekday.friday.rawValue, minutesWorked: 90),
        DayDataPoint(weekday: DayDataPoint.Weekday.saturday.rawValue, minutesWorked: 50),
        DayDataPoint(weekday: DayDataPoint.Weekday.sunday.rawValue, minutesWorked: 130),
        DayDataPoint(weekday: DayDataPoint.Weekday.saturday.rawValue, minutesWorked: 50),
        DayDataPoint(weekday: DayDataPoint.Weekday.sunday.rawValue, minutesWorked: 130)
    ]
    
    private var maxMinutesWorked: Int = 280
    
    var body: some View {
        GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                ForEach(self.monthlyData.indices) { index in
                    BarView(
                        index: index,
                        height: proxy.size.height,
                        actualMeasure: self.monthlyData[index].minutesWorked,
                        maxMeasure: self.maxMinutesWorked
                    )
                        .transition(.slide)
                        .animation(.ripple(index: index, speedFactor: 4))
                }
            }
        }
    }
}

struct MonthlyBarChart_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyBarChart()
    }
}
