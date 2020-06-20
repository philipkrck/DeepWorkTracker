//
//  AnalyticsView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 20.06.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

enum BarChartType: String, CaseIterable {
    case month = "month"
    case lastWeek = "last week"
    case week = "week"
}

struct Chart: ViewModifier {
    let width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: width - 48, height: 250)
            .padding(.horizontal, 24)
            .transition(.moveAndFade)
    }
}

extension View {
    func chartStyle(width: CGFloat) -> some View {
        self.modifier(Chart(width: width))
    }
}

struct AnalyticsView: View {
    @State private var barChartTypes = BarChartType.allCases
    @State private var barChartTypeIndex = 2
    
    private var selectedBarChartType: BarChartType {
        barChartTypes[barChartTypeIndex]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("History")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker("Bar Chart Selection", selection: $barChartTypeIndex) {
                    ForEach(0..<barChartTypes.count, id: \.self) {
                        Text(self.barChartTypes[$0].rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.horizontal, .bottom], 24)
                
                // ToDo: extract bar chart modifiers into view modifier
                GeometryReader { proxy in
                    if self.selectedBarChartType == .week {
                        WeeklyBarChart()
                            .chartStyle(width: proxy.size.width)
                    } else if self.selectedBarChartType == .lastWeek {
                        WeeklyBarChart()
                            .chartStyle(width: proxy.size.width)
                    } else {
                        MonthlyBarChart()
                            .chartStyle(width: proxy.size.width)
                    }
                }
            }
            .navigationBarTitle("Analytics")
        }
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}
