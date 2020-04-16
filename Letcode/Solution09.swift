//
//  Solution09.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/28.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class CQueue {
    
    var stack1: Stack
    
    var stack2: Stack
    
    init() {
        self.stack1 = Stack()
        self.stack2 = Stack()
    }

    func appendTail(_ value: Int) {
        // 进栈时, 直接把元素放到1号栈即可
        self.stack1.push(value)
    }

    func deleteHead() -> Int {
        // 如果2号栈没元素, 就把1号栈倒进2号, 这样1号的元素就颠倒存进2号了, 2号栈顶元素就是队头元素.
        // 如果2好没有元素, 1号也没有元素, 那么表示栈空.
        if self.stack2.isEmpty {
            while !self.stack1.isEmpty {
                self.stack2.push(self.stack1.pop()!)
            }
        }
        
        if self.stack2.isEmpty {
            return -1
        }
        return self.stack2.pop()!
    }
}
