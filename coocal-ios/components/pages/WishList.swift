//
//  WishList.swift
//  coocal-ios
//
//  Created by agumy on 2021/08/07.
//

import SwiftUI

struct WishList: View {
    var body: some View {
        ScrollView {
            Text("メニュー１")
            Text("メニュー１")
            Text("メニュー１")
            Text("メニュー１")
        }
        .frame(alignment: .trailing)
    }
}

struct WishList_Previews: PreviewProvider {
    static var previews: some View {
        WishList()
    }
}
