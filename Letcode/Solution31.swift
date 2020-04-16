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
