//
//  DurationPickerView.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 27.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import SwiftUI
import UIKit

struct DurationPickerView: UIViewRepresentable {
    @Binding var timeInterval: TimeInterval

    func makeCoordinator() -> DurationPickerView.Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .countDownTimer
        datePicker.addTarget(context.coordinator, action: #selector(Coordinator.onDateChanged), for: .valueChanged)
        return datePicker
    }

    func updateUIView(_ datePicker: UIDatePicker, context: Context) {
        let date = Calendar.current.date(bySettingHour: timeInterval.hours, minute: timeInterval.minutes, second: timeInterval.seconds, of: datePicker.date)!
        datePicker.setDate(date, animated: true)
    }

    class Coordinator: NSObject {
        var durationPicker: DurationPickerView

        init(_ durationPicker: DurationPickerView) {
            self.durationPicker = durationPicker
        }

        @objc func onDateChanged(sender: UIDatePicker) {
            print(sender.date)
            let calendar = Calendar.current
            let date = sender.date
            durationPicker.timeInterval = Double(calendar.component(.hour, from: date) * 3600 + calendar.component(.minute, from: date) * 60 + calendar.component(.second, from: date))
        }
    }
}

struct Time {
    var hour: Int
    var minute: Int
    var second: Int = 0
}

struct DurationPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DurationPickerView(timeInterval: .constant(3600 * 50))
    }
}
