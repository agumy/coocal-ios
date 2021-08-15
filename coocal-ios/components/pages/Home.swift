//
//  Home.swift
//  coocal-ios
//
//  Created by agumy on 2021/07/24.
//

import SwiftUI

struct Home: View {
    @State private var targetDate = Date()
    let formatter = DateFormatter.day

    
    var body: some View {
        VStack {
            MonthlyNavigation(targetDate: $targetDate)
            MonthlyCalendar(targetDate: $targetDate) { d in
                Button(action: {
                    self.targetDate = d
                },label: {
                    if (Calendar.current.isDate(d, inSameDayAs: Date())) {
                        Text(formatter.string(from: d))
                            .padding(8)
                            .foregroundColor(.blue)
                    } else {
                        Text(formatter.string(from: d))
                            .padding(8)
                            .foregroundColor(.black)
                    }

                })
            }
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
