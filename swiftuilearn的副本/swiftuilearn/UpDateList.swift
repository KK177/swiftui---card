//
//  UpDateList.swift
//  swiftuilearn
//
//  Created by MacBook pro on 2020/10/4.
//  Copyright © 2020 MacBook pro. All rights reserved.
//

import SwiftUI

struct UpDateList: View {
    var updates = updateDate
    @ObservedObject var store = UpdateStore(updates: updateDate)
    
    @State var show = false
    
    func addUpdate() {
        store.updates.append(Update(image: "Certificate1", title: "xascxz", text: "xcwkncxcq", date: "JUL 1"))
    }
    
    func move(from source : IndexSet, to destiation : Int) {
        store.updates.move(fromOffsets: source, toOffset: destiation)
    }
    var body: some View {
        NavigationView {
            VStack {
                Button(action: addUpdate) {
                    Text("add Update")
                        .foregroundColor(.white)
                    
                }
                .padding(8)
                .background(Color("background3"))
                .cornerRadius(8)
                
                List{
                    ForEach(store.updates) { item in
                        NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                            HStack(spacing: 12.0) {
                                Image(item.image)
                                    .resizable()
                                    .frame(width: 80.0, height: 80.0)
                                    .aspectRatio(contentMode: .fit)
                                    .background(Color("background"))
                                    .cornerRadius(20)
                                
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.headline)
                                    Text(item.text)
                                        .lineLimit(2)
                                        .lineSpacing(4)
                                        .font(.subheadline)
                                        .frame(height:50)
                                    Text(item.date)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        .padding(.vertical, 8.0)
                    }
                    .onDelete{ index in
                        self.store.updates.remove(at: index.first!)
                    }
                    .onMove(perform: move)
                }
                .navigationBarTitle(Text("Updata"))
                .navigationBarItems(trailing:
                    EditButton()
                )
            }
        }
    }
}

struct UpDateList_Previews: PreviewProvider {
    static var previews: some View {
        UpDateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateDate = [
    Update(image: "Illustration1", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Illustration2", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Illustration3", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Illustration4", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Certificate1", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Certificate2", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Certificate3", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
]
