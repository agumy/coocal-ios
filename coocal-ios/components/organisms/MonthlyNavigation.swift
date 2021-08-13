//
//  MonthlyNavigation.swift
//  coocal-ios
//
//  Created by agumy on 2021/07/24.
//

import SwiftUI

struct MonthlyNavigation: View {
    @Binding var targetDate: Date
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    targetDate = Calendar.current.date(
                        byAdding: .month,
                        value: -1,
                        to: $targetDate.wrappedValue
                    )!
                }, label: {Text("←")})
                Text(DateFormatter.month.string(from: targetDate))
                Button(action: {
                    targetDate = Calendar.current.date(
                        byAdding: .month,
                        value: 1,
                        to: $targetDate.wrappedValue
                    )!
                }, label: {Text("→")})
                Spacer()
                Text("Today")
            }
            .foregroundColor(.black)
        }
        .padding()
    }
}

struct MonthlyNavigation_Previews: PreviewProvider {
    @State static var targetDate = Date()
    static var previews: some View {
        MonthlyNavigation(targetDate: .constant(Date()))
    }
}
