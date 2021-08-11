//
//  Home.swift
//  coocal-ios
//
//  Created by agumy on 2021/07/24.
//

import SwiftUI

struct Home: View {
    let formatter = DateFormatter.day
    
    var body: some View {
        VStack {
            MonthlyNavigation()
            MonthlyCalendar(targetDate: Date()) { d in
                Text(formatter.string(from: d))
                    .padding(4)
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
