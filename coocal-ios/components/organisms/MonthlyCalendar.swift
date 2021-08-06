//
//  MonthlyCalendar.swift
//  coocal-ios
//
//  Created by agumy on 2021/07/24.
//

import SwiftUI

struct MonthlyCalendar: View {
    var date: Date

    private let formatter = DateFormatter()
    private let dayFormmater = DateFormatter()
    private let calendar = Calendar(identifier: .gregorian)

    private var dates: [Date] {
        var ds: [Date] = []
        let start = date.startOfMonth()
        let end = date.endOfMonth()
        ds.append(start)

        
        calendar.enumerateDates(startingAfter: start, matching: DateComponents(hour: 0, minute: 0, second: 0), matchingPolicy: .nextTime) { d, _, stop in
            if let d = d {
                if d < end {
                    ds.append(d)
                } else {
                    stop = true
                }
            }
        }
        return ds
    }
    
    private func format(from: Date) -> String {
        dayFormmater.dateFormat = "dd"
        return dayFormmater.string(from: date)
    }
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(0..<7, id: \.self) { n in
                    Text(formatter.shortWeekdaySymbols[n])
                }
                
                ForEach(dates, id: \.self) { d in
                    Text(format(from: d))
                }
            }
        }
    }
}

struct MonthlyCalendar_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyCalendar(date: Date())
    }
}
