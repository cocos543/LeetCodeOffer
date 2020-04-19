//
//  Solution59_2.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/19.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 面试题59 - II. 队列的最大值
 
 请定义一个队列并实现函数 max_value 得到队列里的最大值，要求函数max_value、push_back 和 pop_front 的均摊时间复杂度都是O(1)。

 若队列为空，pop_front 和 max_value 需要返回 -1

 示例 1：

 输入:
 ["MaxQueue","push_back","push_back","max_value","pop_front","max_value"]
 [[],[1],[2],[],[],[]]
 输出: [null,null,null,2,1,2]
 示例 2：

 输入:
 ["MaxQueue","pop_front","max_value"]
 [[],[],[]]
 输出: [null,-1,-1]
  

 限制：

 1 <= push_back,pop_front,max_value的总操作数 <= 10000
 1 <= value <= 10^5

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/dui-lie-de-zui-da-zhi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class MaxQueue {

    var q: [Int]

    // 存放最大值的队列, 头部是最大值, 往后逐个递减
    // 这是一个双端队列, 支持队头出队或者队尾出队
    private var maxQ: [Int]
    private var maxFront: Int // 队头
    private var maxRear: Int  // 队尾

    var front: Int // 队头
    var rear: Int  // 队尾

    init() {
        // 队列的容量设置在10000个
        q = Array(repeating: -1, count: 10000 + 1)
        maxQ = Array(repeating: -1, count: 10000 + 1)
        front = 0
        rear = 0

        maxFront = 0
        maxRear = 0
    }

    private func isEmptyMax() -> Bool {
        return maxFront == maxRear
    }

    private func isFullMax() -> Bool {
        return maxFront == (maxRear + 1) % maxQ.count
    }


    func isEmpty() -> Bool {
        return front == rear
    }

    func isFull() -> Bool {
        return front == (rear + 1) % q.count
    }

    // 获取队列的队尾元素(注意maxRear指向的不是队尾, 而是队尾+1的位置)
    private func getMaxQRearIndex() -> Int {
        if maxRear != 0 {
            return maxRear - 1
        }else {
            return maxQ.count - 1
        }
    }

    // maxQ队尾出队
    @discardableResult private func popLastMaxQ() -> Int {
        let v = maxQ[getMaxQRearIndex()]
        // 移动队尾
        maxRear = getMaxQRearIndex()
        return v
    }
    // 队头出队
    @discardableResult private func popMaxQ() -> Int {
        if !isEmptyMax() {
            let v = maxQ[maxFront]
            maxFront = (maxFront + 1) % maxQ.count
            return v
        }
        return -1
    }

    private func pushMaxQ(_ v: Int) {
        maxQ[maxRear] = v
        maxRear = (maxRear + 1) % maxQ.count
    }
    
    func max_value() -> Int {
        if isEmptyMax() {
            return -1
        }
        return maxQ[maxFront]
    }
    
    func push_back(_ value: Int) {
        if isFull() {
            return
        }
        // 插入一个元素之后, 如果max队列为空的, 元素直接放入max队列
        if isEmptyMax() {
            pushMaxQ(value)
        }else {
            // 如果max队列不为空的, 则把队列里面比value小的元素都删了, 然后再把value放入max队列
            // 这样做的话, 就能保证max队列里面的元素都是顺序递减, 队头最大, 队尾最小
            while !isEmptyMax() && maxQ[getMaxQRearIndex()] < value {
                _ = popLastMaxQ()
            }
            pushMaxQ(value)
        }

        q[rear] = value
        rear = (rear + 1) % q.count

    }
    
    @discardableResult func pop_front() -> Int {
        if isEmpty() {
            return -1
        }
        // 出队的时候, 如果元素也在也在max队头的话, max队头跟着出队
        let v = q[front]
        front = (front + 1) % q.count
        
        if !isEmptyMax() {
            if maxQ[maxFront] == v {
                _ = popMaxQ()
            }
        }
        
        return v
    }
}

/**
 * Your MaxQueue object will be instantiated and called as such:
 * let obj = MaxQueue()
 * let ret_1: Int = obj.max_value()
 * obj.push_back(value)
 * let ret_3: Int = obj.pop_front()
 */
