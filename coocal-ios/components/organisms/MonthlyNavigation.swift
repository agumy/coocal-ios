//
//  MonthlyNavigation.swift
//  coocal-ios
//
//  Created by agumy on 2021/07/24.
//

import SwiftUI

struct MonthlyNavigation: View {
    var body: some View {
        VStack {
            HStack {
                Text("←")
                Text("2021/07")
                Text("→")
                Spacer()
                Text("今日")
            }
        }
        .padding()
    }
}

struct MonthlyNavigation_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyNavigation()
    }
}
