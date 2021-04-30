//
//  Stack.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/25.
//

import Foundation

class Stack {
    private var context: [Int]
    init() {
        context = []
    }
    
    var count: Int {
        return context.count
    }
    
    var isEmpty: Bool {
        return context.isEmpty
    }

    func push(_ e: Int) -> Bool {
        context.append(e)
        return true
    }

    func pop() -> Int? {
//        if context.count == 0 {
//            return nil
//        }

        return context.popLast()
    }
}
