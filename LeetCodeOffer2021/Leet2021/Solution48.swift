//
//  Solution48.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/1.
//

import Foundation
/*
 剑指 Offer 48. 最长不含重复字符的子字符串
 请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子字符串的长度。

  

 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
  
 "qrsvbspk"
 提示：

 s.length <= 40000
 */
class Solution48 {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var set = Set<Character>()
        
        var ans = 0
        var left = 0, right = 0
        let sArr = Array(s)
        
        for i in 0 ..< sArr.count {
            let c = sArr[i]
            right = i
            
            if set.contains(c) {
                while sArr[left] != c {
                    set.remove(sArr[left])
                    left += 1
                }
                left += 1
            } else {
                set.insert(c)
            }
            if right - left  + 1 > ans {
                ans = right - left + 1
            }
        }
        
        return ans
    }
}
