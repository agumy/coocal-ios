//
//  Calendar+generateDates.swift
//  coocal-ios
//
//  Created by agumy on 2021/08/05.
//

import Foundation

//extension Calendar {
//   func generateDates(
//       inside interval: DateInterval,
//       matching components: DateComponents
//   ) -> [Date] {
//       var dates: [Date] = []
//       dates.append(interval.start)
//
//       enumerateDates(
//           startingAfter: interval.start,
//           matching: components,
//           matchingPolicy: .nextTime
//       ) { date, _, stop in
//           if let date = date {
//               if date < interval.end {
//                   dates.append(date)
//               } else {
//                   stop = true
//               }
//           }
//       }
//
//       return dates
//   }
//}
