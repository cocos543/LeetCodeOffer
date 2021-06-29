//
//  Solution58_2.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/19.
//

import Foundation
/*
 剑指 Offer 58 - II. 左旋转字符串
 字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。

  

 示例 1：

 输入: s = "abcdefg", k = 2
 
 输出: "cdefgab"
 示例 2：

 输入: s = "lrloseumgh", k = 6
 输出: "umghlrlose"
  

 限制：

 1 <= k < s.length <= 10000
 通过次数160,935提交次数188,586
 */
class Solution58_2 {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        if n > s.count {
            return s
        }
        
        let sArr = Array(s)
        return String(sArr[n ..< sArr.count]) + String(sArr[0 ..< n])
    }
}
