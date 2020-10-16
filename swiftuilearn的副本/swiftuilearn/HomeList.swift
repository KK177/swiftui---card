//
//  HomeList.swift
//  swiftuilearn
//
//  Created by MacBook pro on 2020/10/4.
//  Copyright © 2020 MacBook pro. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    @State var showModel = false
    var course = courseData
    var body: some View {
        
        //把滑动方向调为横向,且设置为不显示滚动条
        VStack {
            HStack {
                VStack(alignment:.leading) {
                    Text("iiiikkkkkk")
                        .fontWeight(.heavy)
                        .font(.largeTitle)
                    Text("🤯🤯🤯🤯🤯🤯🤯")
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.leading,70)
            .padding(.bottom,40)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing : 30) {
                    ForEach(course) { item in
                        Button(action: {self.showModel = true}) {
                            CourseView(title: item.title, image: item.image, color: item.color, shadowColor: item.shadowColor)
                        }.sheet(isPresented: self.$showModel) {
                            //以弹窗的形式弹出ContentView
                            ContentView()
                        }
                    }
                }
                .padding(.leading,30)
                Spacer()
            }
        }
        .padding(.top,78)
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    var title = "Build an app with SwiftUI"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowColor = Color("BackgroundShadow3")
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(30)
                .lineLimit(4)
                .padding(.trailing,50)
            Spacer()
            Image(image)
                //这个是设置为可调整大小，如果这个不设置，下面那个设置宽高比是不起作用的
                .resizable()
                //解决图片渲染错误问题
                //绘制图片的原始状态
                .renderingMode(.original)
                //设置图片的宽高比以及是否填充整个视图
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom,30)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course:Identifiable {
    var id = UUID()
    var title : String
    var image : String
    var color : Color
    var shadowColor : Color
}

let courseData = [
    Course(
        title: "Build an app with SwiftUI", image:"Illustration1" , color: Color("background3"), shadowColor: Color("BackgroundShadow3")
    ),
    Course(
        title: "Design Course", image:"Illustration2" , color: Color("background4"), shadowColor: Color("BackgroundShadow4")
    )
]
