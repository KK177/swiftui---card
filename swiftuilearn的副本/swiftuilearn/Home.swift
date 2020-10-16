//
//  Home.swift
//  swiftuilearn
//
//  Created by MacBook pro on 2020/10/4.
//  Copyright © 2020 MacBook pro. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var show = false
    @State var showProfile = false
    var body: some View {
        ZStack{
            
            HomeList()
                .blur(radius:show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
            ContentView()
                .cornerRadius(30)
                .shadow(radius: 20)
                .offset( y: showProfile ? 40 : UIScreen.main.bounds.height)
                .animation(.interactiveSpring())
            
            HStack {
                MenuButton(show: $show)
                    .offset(x: -30, y: showProfile ? 0:80)
                    .animation(.spring())
                Spacer()
            }
            HStack {
                Spacer()
                BellButton(show: $showProfile)
                    .offset(x: -16, y: showProfile ? 0:88)
                    .animation(.spring())
                
                PersonButton(show: $showProfile)
                    .offset(x: -16, y: showProfile ? 0:88)
                    .animation(.spring())
            }
            
            //$表示同步
            MenuView(show: $show)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    var body: some View {
        HStack {
            Image(systemName: image)
                //每个image的尺寸不一样，设置frame可以很好地做到对齐
                .frame(width: 32.0, height: 32.0)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}

struct Menu :Identifiable {
    var id = UUID()
    var title : String
    var icon : String
}

let MenuList = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign Out", icon: "arrow.uturn.down"),
]

struct MenuView: View {
    var menu = MenuList
    //@Binding表示跟主控件上的show绑定起来
    @Binding var show:Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            
            ForEach (menu) { item in
                MenuRow(image: item.icon, text:item.title)
            }
            Spacer()
        }
        .padding(.top,20)
        .padding(30)
        .frame(minWidth:0, maxWidth: .infinity)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .padding(.trailing,60)
        .rotation3DEffect(Angle(degrees: self.show ? 0 : 60), axis: (x: 0.0, y: 10.0, z: 0.0))
        .animation(.linear)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct MenuButton: View {
    @Binding var show:Bool
    var body: some View {
        VStack {
            Button(action: { self.show.toggle() }) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.primary)
                }
                .padding(.trailing,20)
                .frame(width: 90.0, height: 60.0)
                .background(BlurView(style: .systemThickMaterial))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
            }
            Spacer()
        }
    }
}

struct BellButton: View {
    @Binding var show:Bool
    var body: some View {
        VStack {
            Button(action: { self.show.toggle() }) {
                HStack {
                    Image(systemName:"bell")
                        .foregroundColor(.primary)
                }
                .frame(width: 44.0, height: 44.0)
                .background(BlurView(style: .systemThickMaterial))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
            }
            Spacer()
        }
    }
}

struct PersonButton: View {
    @Binding var show:Bool
    var body: some View {
        VStack {
            Button(action: { self.show.toggle() }) {
                HStack {
                    Image(systemName:"person.crop.circle")
                        .foregroundColor(.primary)
                }
                .frame(width: 44.0, height: 44.0)
                .background(BlurView.init(style: .systemThickMaterial))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
            }
            Spacer()
        }
    }
}
