//
//  Queue.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/18.
//

import Foundation

class Queue<T> {
    var content: [T?]
    var head = 0
    var tail = 0
    
    init() {
        content = Array(repeating: nil, count: 100001)
    }
    
    func enQueue(_ e: T?) -> Bool {
        if (isFull()) {
            return false
        }
        content[tail] = e
        tail = (tail + 1) % content.count
        return true
    }
    
    func deQueue() -> T? {
        if isEmpty() {
            return nil
        }
        let e = content[head]
        head = (head + 1) % content.count
        return e
    }
    
    func cap() -> Int {
        return content.count - 1
    }
    
    func isEmpty() -> Bool {
        return head == tail
    }
    
    func isFull() -> Bool {
        return (tail + 1) % content.count == head
    }
}
