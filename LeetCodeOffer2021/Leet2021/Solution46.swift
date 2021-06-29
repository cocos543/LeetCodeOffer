//
//  Solution46.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/29.
//

import Foundation
/*
 剑指 Offer 46. 把数字翻译成字符串
 给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。

  

 示例 1:

 输入: 12258
 输出: 5
 解释: 12258有5种不同的翻译，分别是"bccfi", "bwfi", "bczi", "mcfi"和"mzi"
  

 提示：

 0 <= num < 231
 通过次数87,148提交次数161,422
 */

class Solution46 {
    
    var meno: [Int:Int] = [:]
    
    func translateNum(_ num: Int) -> Int {
        return _translateNum(num)
    }

    private func _translateNum(_ num: Int) -> Int {
        if num < 10 {
            return 1
        }
        // 不需要转成字符串, 用除法, 方便从右到左翻译也是一样的
        let n = num % 100
        if n >= 10 && n <= 25 {
            var n1 = 0, n2 = 0
            if meno[num / 10] != nil {
                n1 = meno[num / 10]!
            } else {
                n1 = _translateNum(num / 10)
                meno[num / 10] = n1
            }
            
            if meno[num / 100] != nil {
                n2 = meno[num / 100]!
            } else {
                n2 = _translateNum(num / 100)
                meno[num / 100] = n2
            }
            return n1 + n2
        }
        
        
        var n1 = 0
        if meno[num / 10] != nil {
            n1 = meno[num / 10]!
        } else {
            n1 = _translateNum(num / 10)
            meno[num / 10] = n1
        }
        return n1
    }
}
