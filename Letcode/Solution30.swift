//
//  Solution30.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/2.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class MinStack {

    var items: [Int]
    var minStack: [Int] // 辅助栈, 存放当前栈内的最小元素

    /** initialize your data structure here. */
    init() {
        self.items = [Int]()
        self.minStack = [Int]()
    }

    // 算法思路就是借助一个辅助栈, 存放当前栈内的最小元素.
    // 如下操作就可以让辅助栈的元素一直是最小的
    // 1. 存入新元素, 如果等于小于辅助栈顶的, 则放入辅助栈, 这样可以保证辅助栈顶随着元素入栈, 一直是最小的
    // 2. 元素出栈, 如果和辅助栈顶一样, 则顺便把辅助栈顶元素弹出, 这样可以保证辅助栈的元素一直是有效的.
    func min() -> Int {
        if minStack.count == 0 {
            return -1
        }
        return minStack.last!
    }

    func push(_ ele: Int) {
        items.append(ele)
        if minStack.count == 0 || ele <= min() {
            minStack.append(ele)
        }
    }

    func pop() {
        let ele = items.popLast()
        if let e = ele {
            if e == minStack.last! {
                minStack.popLast()
            }
        }
    }

    func top() -> Int {
        if items.count == 0 {
            return -1
        }else {
            return items.last!
        }
    }
    
    
}

class MinStack2 {

    var items: [Int]
    var minStack: [Int]

    /** initialize your data structure here. */
    init() {
        self.items = [Int]()
        self.minStack = [Int]()
    }
    
    func push(_ x: Int) {
        self.items.append(x)
        if self.minStack.count == 0 {
            self.minStack.append(x)
        }else if self.minStack.last! >= x {
            self.minStack.append(x)
        }
    }
    
    func pop() {
        let ele = self.items.popLast()
        // ele不为空的话, minStack里最少也会有一个元素
        if ele != nil && ele! == self.minStack.last! {
            _ = self.minStack.popLast()
        }
    }
    
    func top() -> Int {
        if self.items.count == 0 {
            return -1
        }
        return self.items.last!
    }
    
    func min() -> Int {
        // 思路就是再使用一个栈(min栈), 用来存每一次遇到的最小的数, 这样栈顶就是最小的数
        // 只有比min栈的栈顶还小的数, 才能进入min栈
        // 出栈的时候, 需要和min栈的栈顶比较一下, 如果和栈顶相同则一起出栈
        if self.minStack.count == 0 {
            return -1
        }
        return self.minStack.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.min()
 */
