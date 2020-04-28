//
//  File.swift
//  
//
//  Created by Philip Krück on 28.04.20.
//

import Foundation

public extension TimeInterval {
    
    var hours: Int {
        Int(self) / 3600
    }
    
    var minutes: Int {
        (Int(self) - hours * 3600) / 60
    }
    
    var seconds: Int {
        Int(self) - hours * 3600 - minutes * 60
    }
    
    var formattedDigitalTime: String {
        let hourString = hours > 0 ? "\(hours):" : ""
        let minutesString = "\(zeroPaddedTimeComponent(component: minutes)):"
        let secondsString = zeroPaddedTimeComponent(component: seconds)
        
        return hourString + minutesString + secondsString
    }
    
    private func zeroPaddedTimeComponent(component: Int) -> String {
        guard component <= 60 else { fatalError("invalid component") }
        guard component < 10 else { return "\(component)"}
        
        return "0\(component)"
    }
    
    var formattedSpokenTime: String {
        var formattedHours = ""
        var formattedMinutes = ""
        let space = (hours >= 1 && minutes >= 1) ? " " : ""
        
        if hours == 1 {
            formattedHours = "1 hour"
        } else if hours > 1 {
            formattedHours = "\(hours) hours"
        }
        
        if minutes == 1 {
            formattedMinutes = "1 minute"
        } else if minutes > 1 {
            formattedMinutes = "\(minutes) minutes"
        }
        
        return formattedHours + space + formattedMinutes
    }
}
