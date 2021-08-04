//
//  Home.swift
//  coocal-ios
//
//  Created by agumy on 2021/07/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            MonthlyNavigation()
            MonthlyCalendar()
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
