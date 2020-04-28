//
//  TimeIntervaleTests.swift
//  
//
//  Created by Philip Krück on 28.04.20.
//

import XCTest
import FoundationExtensions

class TimeIntervalTests: XCTestCase {
    
    func testHours() {
        let zeroHours: TimeInterval = 0
        let oneHour: TimeInterval = 3600
        let fourHours: TimeInterval = 4 * 3600
        
        
        XCTAssertEqual(zeroHours.hours, 0)
        XCTAssertEqual(oneHour.hours, 1)
        XCTAssertEqual(fourHours.hours, 4)
    }
    
    func testMinutes() {
        let zeroMinutes: TimeInterval = 0
        let fortyMinutes: TimeInterval = 40 * 60
        let twoHoursTwentyOneMinutes: TimeInterval = 3600*2 + 60*21
        
        XCTAssertEqual(zeroMinutes.minutes, 0)
        XCTAssertEqual(fortyMinutes.minutes, 40)
        XCTAssertEqual(twoHoursTwentyOneMinutes.minutes, 21)
    }
    
    func testSeconds() {
        let zeroSeconds: TimeInterval = 0
        let twentyFiveSeconds: TimeInterval = 25
        let fourMinutesThirtyFiveSeconds: TimeInterval = 4*60 + 35
        let oneHourOneMinuteFiftyNineSeconds: TimeInterval = 3600 + 60 + 59
        
        XCTAssertEqual(zeroSeconds.seconds, 0)
        XCTAssertEqual(twentyFiveSeconds.seconds, 25)
        XCTAssertEqual(fourMinutesThirtyFiveSeconds.seconds, 35)
        XCTAssertEqual(oneHourOneMinuteFiftyNineSeconds.seconds, 59)
    }
    
    func testFormattedDigitalTime() {
        let fiveHoursfortyFourMinsFiftyEightSeconds: TimeInterval = 5*3600 + 44*60 + 58
        let oneHourOneMinuteFiveSeconds: TimeInterval = 1*3600 + 60 + 5
        let fortyOneMinutes: TimeInterval = 41*60
        let sixteenSeconds: TimeInterval = 16
        
        
        XCTAssertEqual(fiveHoursfortyFourMinsFiftyEightSeconds.formattedDigitalTime, "5:44:58")
        XCTAssertEqual(oneHourOneMinuteFiveSeconds.formattedDigitalTime, "1:01:05")
        XCTAssertEqual(fortyOneMinutes.formattedDigitalTime, "41:00")
        XCTAssertEqual(sixteenSeconds.formattedDigitalTime, "00:16")
    }
}
