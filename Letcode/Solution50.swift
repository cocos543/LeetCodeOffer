//
//  Solution50.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/10.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution50 {
    func firstUniqChar(_ s: String) -> Character {
        // 用一个散列表保存一下每一个字符, 然后找到计数只有1的字符
        // 因为字符最多就128个, 所以开一个数组, 用于存放每个不同的字符, 从0开始存储, 再用一个散列表保存字符对应的数组下标
        var cArr = [Int]()
        var map = Array(repeating: -1, count: 128)

        for c in s {
            let cVal = Int(c.asciiValue!)
            if map[cVal] == -1 {
                let index = cArr.count
                // 把字符的ascii值存入数组
                cArr.append(cVal)
                // 记录字符在数组的下标
                map[cVal] = index

            } else {
                // 字符已经在数组中了. 查询下标之后到数组里更新计数为-1, 表示已经重复
                cArr[map[cVal]] = -1
            }
        }

        for i in 0 ..< cArr.count {
            if cArr[i] > -1 {
                return Character(UnicodeScalar(cArr[i])!)
            }
        }
        return " "
    }
}
