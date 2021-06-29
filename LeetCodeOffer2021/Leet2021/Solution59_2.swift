//
//  Solution59_2.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/22.
//

import Foundation
/*
 剑指 Offer 59 - II. 队列的最大值
 请定义一个队列并实现函数 max_value 得到队列里的最大值，要求函数max_value、push_back 和 pop_front 的均摊时间复杂度都是O(1)。

 若队列为空，pop_front 和 max_value 需要返回 -1

 示例 1：

 输入:
 ["MaxQueue","push_back","push_back","max_value","pop_front","max_value"]
 [[],[1],[2],[],[],[]]
 输出: [null,null,null,2,1,2]
 示例 2：

 输入:
 ["MaxQueue","pop_front","max_value"]
 [[],[],[]]
 输出: [null,-1,-1]

 限制：

 1 <= push_back,pop_front,max_value的总操作数 <= 10000
 1 <= value <= 10^5
 通过次数78,203提交次数164,789
 */

class MaxQueue {
    // 循环队列
    var queue: [Int]
    var font: Int
    var rear: Int

    // 循环队列, 队头就是最大值
    private var maxQueue: [Int]
    private var maxFont: Int
    private var maxRear: Int

    init() {
        queue = Array(repeating: 0, count: 10000 + 1)
        font = 0
        rear = 0
        maxQueue = Array(repeating: 0, count: 10000 + 1)
        maxFont = 0
        maxRear = 0
    }

    private func isEmptyMax() -> Bool {
        return maxFont == maxRear
    }

    private func isFullMax() -> Bool {
        return maxFont == (maxRear + 1) % maxQueue.count
    }
    
    private func maxPush_back(_ value: Int) {
        if isFullMax() {
            return
        }
        maxQueue[maxRear] = value
        maxRear = (maxRear + 1) % maxQueue.count
    }
    
    private func maxPop_font() -> Int {
        if isEmptyMax() {
            return -1
        }
        let val = maxQueue[maxFont]
        maxFont = (maxFont + 1) % maxQueue.count
        return val
    }

    func isEmpty() -> Bool {
        return font == rear
    }

    func isFull() -> Bool {
        return font == (rear + 1) % queue.count
    }

    func max_value() -> Int {
        if isEmptyMax() {
            return -1
        }
        return maxQueue[maxFont]
    }

    func push_back(_ value: Int) {
        if isFull() {
            return
        }
        
        if isEmptyMax() {
            maxPush_back(value)
        } else {
            // 这样写能支持rear=0的情况, 此时rear往左走一格即可回到数组尾部
            while !isEmptyMax() && maxQueue[(maxRear - 1 + maxQueue.count) % maxQueue.count] < value {
                maxRear = (maxRear - 1 + maxQueue.count) % maxQueue.count
            }
            maxPush_back(value)
        }
        
        queue[rear] = value
        rear = (rear + 1) % queue.count
    }

    func pop_front() -> Int {
        if isEmpty() {
            return -1
        }
        
        let val = queue[font]
        // maxQueue不可能是empty, 所以无需额外判断
        if maxQueue[maxFont] == val {
            _ = maxPop_font()
        }
        
        font = (font + 1) % queue.count
        return val
    }
}

/**
 * Your MaxQueue object will be instantiated and called as such:
 * let obj = MaxQueue()
 * let ret_1: Int = obj.max_value()
 * obj.push_back(value)
 * let ret_3: Int = obj.pop_front()
 */
