//
//  Solution37.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/25.
//

import Foundation
/*
 剑指 Offer 38. 字符串的排列
 输入一个字符串，打印出该字符串中字符的所有排列。

 你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。

 示例:

 输入：s = "abc"
 输出：["abc","acb","bac","bca","cab","cba"]

 限制：

 1 <= s 的长度 <= 8

 通过次数98,338提交次数174,617

 */
class Solution38 {
    var ret: Set<String> = []

    func permutation(_ s: String) -> [String] {
        if s.count == 0 {
            return []
        }
        _permutation(s, 0)

        return Array(ret)
    }

    func _permutation(_ s: String, _ start: Int) {
        if start == s.count {
            ret.insert(s)
        }

        var vs = s
        for i in start ..< vs.count {
            let c = vs[start]
            vs[start] = vs[i]
            vs[i] = c

            _permutation(vs, start + 1)

            vs[i] = vs[start]
            vs[start] = c
        }
    }

    var cret: Set<String> = []
    func combination(_ s: String) -> [String] {
        if s.count == 0 {
            return []
        }

        for i in 1 ... s.count {
            _combination(s, i, "")
        }

        return Array(cret)
    }

    // 长度为n的字符串, 所有组合中的长度种类有1,2,3,4...n-1, 一共n-1种
    func _combination(_ s: String, _ m: Int, _ sel: String) {
        if m == 0 {
            print(sel)
            cret.insert(sel)
            return
        }
        // 分两种情况, 第一种, 假设当前组合长度m, 包含首字符, 则在剩余字符里面找m-1个字符出来
        var str = sel + String(s[0])
        if s.count == 1 {
            // 如果一直选择从非第一个字符串中去选字符, 那么m永远不等于1, 但是s可能只剩下一个字符了, 这种是不符合要求的, 所以直接返回
            if m == 1 {
                print(str)
                cret.insert(str)
            }
            return
        }
        _combination(s[1 ..< s.count], m - 1, str)
        
        str = sel
        // 第二种, 不包含首字符串, 则在剩余字符里面找m个出来
        _combination(s[1 ..< s.count], m, str)
    }
}
