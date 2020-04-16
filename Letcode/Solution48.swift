//
//  Solution48.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/8.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 面试题48. 最长不含重复字符的子字符串
 请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子字符串的长度。

  

 示例 1:

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
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution48 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // 用滑动的窗口, 窗口里面都是不重复的子串, 最后窗口最大长度, 就是无重复子串的长度
        var set = Set<Character>()
        
        // 用left和right来记录当前子串的区间
        var ret = 0
        var left = 0
        let sArr = Array(s)
        
        for right in 0 ..< s.count {
            while set.contains(sArr[right]) {
                // 窗口左边缩小一格
                set.remove(sArr[left])
                left = left + 1
            }
            set.insert(sArr[right])
            if set.count > ret {
                ret = set.count
            }
        }
        return ret
    }
}
