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

    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(0..<7, id: \.self) { n in
                    Text(formatter.shortWeekdaySymbols[n])
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
