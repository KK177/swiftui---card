//
//  tabBar.swift
//  swiftuilearn
//
//  Created by MacBook pro on 2020/10/6.
//  Copyright © 2020 MacBook pro. All rights reserved.
//

import SwiftUI

struct tabBar: View {
    var body: some View {
        TabView{
            Home().tabItem {
                Image("IconHome")
                Text("Home")
            }
            ContentView().tabItem {
                Image("IconCards")
                Text("Certificates")
            }
            UpDateList().tabItem {
                Image("IconSettings")
                Text("Updates")
            }
        }
    }
}

struct tabBar_Previews: PreviewProvider {
    static var previews: some View {
        tabBar()
        //.environment(\.colorScheme, .dark)
    }
}
