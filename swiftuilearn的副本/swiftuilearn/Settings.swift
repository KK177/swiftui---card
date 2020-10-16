//
//  Settings.swift
//  swiftuilearn
//
//  Created by MacBook pro on 2020/10/6.
//  Copyright © 2020 MacBook pro. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var receive = false
    @State var number = 1
    @State var selection = 1
    @State var date = Data()
    var body: some View {
        NavigationView{
            Form{
                Toggle(isOn: $receive) {
                    Text("Hello")
                }
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) ")
                }
                Picker(selection: $selection, label: Text("Picker")) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                }
                //DatePicker(selection: $date, label: { Text("Date") })
            }.navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
