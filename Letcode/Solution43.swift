//
//  Solution43.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/7.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution43 {
    func countDigitOne(_ n: Int) -> Int {
        // 最简单的解法, 就是把每一个数都拿出来和1取模, 然后再除以10, 继续直到为0
        var count = 0
        for i in 0 ..< n+1 {
            var num = i
            while num > 0 {
                if num % 10 == 1 {
                    count = count + 1
                }
                num = num / 10
            }
        }
        return count
    }
}
