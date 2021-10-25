//
//  DateFormatter.swift
//  AIS_GAI
//
//  Created by Admin on 22.10.2021.
//

import Foundation

class DateManager{

    func getCurrentDate() -> Date? {
        let date = Date()
        let calendar = Calendar.current
        let second = calendar.component(.second, from: date)
        let minute = calendar.component(.minute, from: date)
        let hour = calendar.component(.hour, from: date)
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        let dateComponents = DateComponents(calendar: calendar, timeZone: .autoupdatingCurrent, era: nil, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        
        return calendar.date(from: dateComponents)
    }

    func convertDateToString(date: Date?) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm d.MM.y"
        return formatter.string(from: date ?? Date())
    }
}
