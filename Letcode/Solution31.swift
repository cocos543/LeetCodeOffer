//
//  Solution31.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/3.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution31 {
    
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        // 定义一个辅助栈, 用来根据pushed数组的情况, 存放元素
        // 先对比辅助栈是否和popped相等, 相等则弹出辅助栈栈顶.
        // 再把元素存入辅助栈, 再和popped的栈顶比较, 如果相等, 则出栈, 再把poped第一个元素删除
        // 如果不相等, 则继续从pushed中取出元素放入辅助栈.
        // 直到pushed没有元素了, 这个时候辅助栈元素也和poped不等, 则失败了返回false

        // 上面算法的思路, 其实就是直接按部就班, 按照pushed的数据真实操作入栈, 并时时和popped数组比较.
        // 下面代码是可以优化的, 直接用下标访问pushed, popped数组即可.不需要移动头部元素(移动复杂度是O(n))
        if pushed.count == 0 {
            return true
        }
        var stack = [Int]()
        var pushed = pushed, popped = popped
        while popped.count > 0 {
            if stack.count > 0 {
                if stack.last == popped.first {
                    _ = stack.popLast()
                    popped.removeFirst()
                    continue
                }
            }

            if pushed.count > 0 {
                let e = pushed.removeFirst()
                if e == popped.first! {
                    popped.removeFirst()
                }else {
                    stack.append(e)
                }
            }else {
                return false
            }
        }
        return true
        
    }
    
    func validateStackSequences2(_ pushed: [Int], _ popped: [Int]) -> Bool {
        if pushed.count == 0 || popped.count == 0 {
            return true
        }
        var helpStack = [Int]()
        var j = 0
        for item in pushed {
            helpStack.append(item)
            while !helpStack.isEmpty && j < popped.count && helpStack.last == popped[j] {
                helpStack.removeLast()
                j += 1
            }
        }
        return helpStack.isEmpty
    }
}
