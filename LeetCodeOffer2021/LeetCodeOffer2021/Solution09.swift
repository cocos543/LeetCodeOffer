//
//  Solution09.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/25.
//

import Foundation
/*
 用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )

 示例 1：

 输入：
 ["CQueue","appendTail","deleteHead","deleteHead"]
 [[],[3],[],[]]
 输出：[null,null,3,-1]
 示例 2：

 输入：
 ["CQueue","deleteHead","appendTail","appendTail","deleteHead","deleteHead"]
 [[],[],[5],[2],[],[]]
 输出：[null,-1,null,null,5,2]
 提示：

 1 <= values <= 10000
 最多会对 appendTail、deleteHead 进行 10000 次调用

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */



class CQueue {
    /*
     思路很简单, 两个栈分别负责入队和出队. 入队时确保出队栈全部转移到入队栈中;
     同理, 出队时确保入队栈全部转移到出队栈
     
     可优化: 入队时无需把出队栈转移到入队栈, 可以直接入队到入队栈. 然后出队时等到出队栈元素为空时,才把入队栈的元素转移到入队栈中.
     */
    
    // 入队栈
    var inS: Stack
    // 出队栈
    var outS: Stack
    
    init() {
        inS = Stack()
        outS = Stack()
    }

    func appendTail(_ value: Int) {
        while !outS.isEmpty {
            if let v = outS.pop() {
                _ = inS.push(v)
            }
        }
        
        _ = inS.push(value)
    }

    func deleteHead() -> Int {
        while !inS.isEmpty {
            if let v = inS.pop() {
                _ = outS.push(v)
            }
        }
        
        let v = outS.pop()
        
        return v ?? -1
    }
}

/**
 * Your CQueue object will be instantiated and called as such:
 * let obj = CQueue()
 * obj.appendTail(value)
 * let ret_2: Int = obj.deleteHead()
 */
