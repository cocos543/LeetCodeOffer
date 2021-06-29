//
//  Solution45.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/28.
//

import Foundation
/*
 剑指 Offer 45. 把数组排成最小的数
 输入一个非负整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。

 示例 1:

 输入: [10,2]
 输出: "102"
 示例 2:

 输入: [3,30,34,5,9]
 输出: "3033459"

 提示:

 0 < nums.length <= 100
 说明:

 输出结果可能非常大，所以你需要返回一个字符串而不是整数
 拼接起来的数字可能会有前导 0，最后结果不需要去掉前导 0
 通过次数76,086提交次数135,618
 */

class Solution45 {
    func minNumber(_ nums: [Int]) -> String {
        if nums.count == 0 {
            return ""
        }
        // 使用普通排序算法排序元素, 再使用特殊的规则匹配替代原来排序的数值大小匹配, 即可解答问题
        var sortArr = nums
        for i in 1 ..< sortArr.count {
            let t = sortArr[i]
            var need = false
            var jj = 0
            for j in stride(from: i-1, through: 0, by: -1) {
                if isSwitching(sortArr[j], b: t) {
                    sortArr[j+1] = sortArr[j]
                    need = true
                    jj = j
                } else {
                    break
                }
            }
            if need {
                sortArr[jj] = t
            }
        }
        
        var ret = ""
        for e in sortArr {
            ret = ret + "," + String(e)
        }
        return ret
    }

    private func isSwitching(_ a: Int, b: Int) -> Bool {
        // 把两个数字转成字符串, 分别按照ab, ba两种拼在一起, 再判断两个数的大小即可
        let str1 = String(a) + String(b)
        let str2 = String(b) + String(a)
        
        return str1 > str2
    }
}
