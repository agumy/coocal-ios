//
//  Home.swift
//  coocal-ios
//
//  Created by agumy on 2021/07/24.
//

import SwiftUI

struct Home: View {
    @State private var targetDate = Date()
    @State private var calendarBaseDate = Date()
    @State private var data: User? = nil
    let formatter = DateFormatter.day
    
    
    var body: some View {
        VStack {
            MonthlyNavigation(targetDate: $calendarBaseDate)
            MonthlyCalendar(targetDate: $calendarBaseDate) { d in
                Button(action: {
                    self.calendarBaseDate = d
                },label: {
                    if (Calendar.current.isDate(d, inSameDayAs: targetDate))  {
                        Text(formatter.string(from: d))
                            .bold()
                            .padding(8)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(20)
                    } else if (Calendar.current.isDate(d, inSameDayAs: Date())) {
                        Text(formatter.string(from: d))
                            .padding(8)
                            .foregroundColor(.red)
                            .onTapGesture {
                                self.targetDate = d
                            }
                    } else {
                        Text(formatter.string(from: d))
                            .padding(8)
                            .foregroundColor(.black)
                            .onTapGesture {
                                self.targetDate = d
                            }
                    }
                    
                })
            }
            Text(self.data?.items[0].login ?? "")
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
