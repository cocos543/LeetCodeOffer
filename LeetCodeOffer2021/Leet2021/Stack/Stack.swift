//
//  Stack.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/25.
//

import Foundation

class Stack<T> {
    private var context: [T]
    init() {
        context = []
    }
    
    var count: Int {
        return context.count
    }
    
    var isEmpty: Bool {
        return context.isEmpty
    }

    func push(_ e: T) -> Bool {
        context.append(e)
        return true
    }

    func pop() -> T? {
        return context.popLast()
    }
    
    func top() -> T? {
        return context.last
    }
}
