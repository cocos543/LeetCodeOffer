//
//  Solution30.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/18.
//

import Foundation

/*
 剑指 Offer 30. 包含min函数的栈
 定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的 min 函数
 
 在该栈中，调用 min、push 及 pop 的时间复杂度都是 O(1)。

  

 示例:

 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.min();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.min();   --> 返回 -2.
  

 提示：

 各函数的调用总次数不超过 20000 次
  

 注意：本题与主站 155 题相同：https://leetcode-cn.com/problems/min-stack/

 通过次数89,186提交次数154,627
 */
class MinStack {
    
    var minArr: [Int]
    var s: Stack<Int>
    
    /** initialize your data structure here. */
    init() {
        minArr = []
        s = Stack()
    }
    
    func push(_ x: Int) {
        if minArr.count == 0 {
            minArr.append(x)
        } else {
            if x <= minArr.last! {
                minArr.append(x)
            }
        }
        _ = s.push(x)
    }
    
    func pop() {
        if s.isEmpty {
            return
        }
        
        let e = s.pop()!
        if e == minArr.last! {
            _ = minArr.popLast()
        }
    }
    
    func top() -> Int {
        if s.isEmpty {
            return 0
        }
        return s.top()!
    }
    
    func min() -> Int {
        if s.isEmpty {
            return 0
        }
        return minArr.last!
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
