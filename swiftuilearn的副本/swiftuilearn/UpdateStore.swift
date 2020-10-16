//
//  UpdateStore.swift
//  swiftuilearn
//
//  Created by MacBook pro on 2020/10/6.
//  Copyright © 2020 MacBook pro. All rights reserved.
//

import SwiftUI
//这里没有ui所以可以把contentView删除掉
//这是一个允许我们进行存储以及修改数据的框架
import Combine

class UpdateStore : ObservableObject {
    let didChange =  PassthroughSubject<Void, Never>()
    
    @Published var updates: [Update] = []
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
}
