//
//  Stack.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/28.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

struct Stack {
    private var items: [Int]

    var count: Int {
        return items.count
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    init() {
        items = [Int]()
    }

    mutating func pop() -> Int? {
        return items.popLast()
    }
    
    mutating func push(_ ele: Int) {
        items.append(ele)
    }
    
    
}
