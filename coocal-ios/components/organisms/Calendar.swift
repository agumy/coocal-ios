import SwiftUI

fileprivate extension DateFormatter {
    static var day: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }
    
    static var week: [String] {
        let formatter = DateFormatter()
        return formatter.shortWeekdaySymbols
    }
}

fileprivate extension Calendar {
    func generateDates(
        inside interval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates: [Date] = []
        dates.append(interval.start)
        
        enumerateDates(
            startingAfter: interval.start,
            matching: components,
            matchingPolicy: .nextTime
        ) { date, _, stop in
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }
        
        return dates
    }
}

struct CalendarView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar
    
    let targetDate: Date
    let content: (Date) -> DateView
    
    init(
        targetDate: Date,
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self.targetDate = targetDate
        self.content = content
    }
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
            ForEach(0..<7, id: \.self) { n in
                Text(DateFormatter.week[n])
            }
            ForEach(days(), id: \.self) { date in
                if calendar.isDate(date, equalTo: targetDate, toGranularity: .month) {
                    content(date).id(date)
                } else {
                    content(date).hidden()
                }
            }
        }
    }
    
    private func days() -> [Date] {
        guard
            let monthInterval = calendar.dateInterval(of: .month, for: targetDate),
            let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
            let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end)
        else { return [] }
        return calendar.generateDates(
            inside: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        let formatter = DateFormatter.day
        CalendarView(targetDate: Date()) { d in
            Text(formatter.string(from: d))
                .padding(8)
        }
    }
}
