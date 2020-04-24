//
//  Solution65.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/24.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution65 {
    func add(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        // 用位运算
        var sum = 0, carry = 0
        
        repeat {
            // 先计算不带进位的加法
            sum = a ^ b
            // 获取进位 a & b 可以得到那些都有1的位, 这些位需要进位处理. 所以在循环内逐个处理
            carry = (a & b) << 1
            
            a = sum
            b = carry
        } while b != 0
        return sum
    }
}
