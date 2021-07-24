//
//  ContentView.swift
//  coocal-ios
//
//  Created by agumy on 2021/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "calendar")
                }
            Home()
                .tabItem {
                    Image(systemName: "cart")
                }
            Home()
                .tabItem {
                    Image(systemName: "list.dash")
                }
            Home()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
