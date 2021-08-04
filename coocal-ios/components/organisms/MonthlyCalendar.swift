//
//  MonthlyCalendar.swift
//  coocal-ios
//
//  Created by agumy on 2021/07/24.
//

import SwiftUI

struct MonthlyCalendar: View {
    private let WEEK = (Array<Int>)(0..<7)
    private let formatter = DateFormatter()
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(WEEK, id: \.self) { n in
                    Text(formatter.shortWeekdaySymbols[n])
                }
                
            }
        }
    }
}

struct MonthlyCalendar_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyCalendar()
    }
}
