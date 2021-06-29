//
//  Solution50.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/3.
//

import Foundation
/*
 剑指 Offer 50. 第一个只出现一次的字符
 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。

 示例:

 s = "abaccdeff"
 返回 "b"

 s = ""
 返回 " "

 限制：

 0 <= s 的长度 <= 50000

 通过次数110,348提交次数180,375

 */
class Solution50 {
    func firstUniqChar(_ s: String) -> Character {
        // 假设字符是26个字母之一
        var store = Array(repeating: 0, count: 26)
        let aChar: Character = "a"
        for c in s {
            store[Int(c.asciiValue! - aChar.asciiValue!)] += 1
        }

        // 第二次扫描数组, 拿出字符查询一下是否出现1次, 是即可返回....
        for c in s {
            if store[Int(c.asciiValue! - aChar.asciiValue!)] == 1 {
                return c
            }
        }

        return " "
    }
}
