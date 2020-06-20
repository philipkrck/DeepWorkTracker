//
//  AnalyticsView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 20.06.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI

enum BarChartType: String, CaseIterable {
    case week
    case month
}

struct AnalyticsView: View {
    @State private var barChartTypes = BarChartType.allCases
    @State private var barChartTypeIndex = 1
    
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
                .padding(.horizontal, 24)
                
                if selectedBarChartType == .week {
                    WeeklyBarChart()
                        .transition(.slide)
                } else {
                    MonthlyBarChart()
                        .transition(.slide)
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
