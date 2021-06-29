//
//  Solution49.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/2.
//

import Foundation
/*
 剑指 Offer 49. 丑数
 我们把只包含质因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。

 示例:

 输入: n = 10
 输出: 12
 解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。
 说明:

 1 是丑数。
 n 不超过1690。
 注意：本题与主站 264 题相同：https://leetcode-cn.com/problems/ugly-number-ii/

 通过次数65,663提交次数101,285
 */
class Solution49 {
    func nthUglyNumber(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }

        // 核心思路, 就是通过数学规律, 得知丑数是可以由已有的丑数乘上2,3,5中的一个而来, 进而可以直接从已有的丑数推算出新的丑数(其实就是动态规划);
        // 而不是遍历每一个自然数再去计算自然数是否是丑数(因为性能差无法AC)

        // 定义一个数组存放已经求出的丑数
        var uglyStore = Array(repeating: 0, count: n)

        // 设置三个指针用来指向当前参加推算的已知丑数(因为并不需要每次推算都从0开始)
        var p2 = 0, p3 = 0, p5 = 0

        uglyStore[0] = 1

        var nextUglyIdx = 1
        while nextUglyIdx < n {
            // 推算出下一个丑数
            uglyStore[nextUglyIdx] = min(uglyStore[p2] * 2, uglyStore[p3] * 3, uglyStore[p5] * 5)

            while uglyStore[p2] * 2 <= uglyStore[nextUglyIdx] {
                p2 += 1
            }

            while uglyStore[p3] * 3 <= uglyStore[nextUglyIdx] {
                p3 += 1
            }

            while uglyStore[p5] * 5 <= uglyStore[nextUglyIdx] {
                p5 += 1
            }

            nextUglyIdx += 1
        }

        return uglyStore[nextUglyIdx - 1]
    }
}

// class Solution49 {
//    func nthUglyNumber(_ n: Int) -> Int {
//        // 根据丑数的定义, 丑数只能被2或者3或者5这三个因子整除, 也就是说, 一个数, 不停除以2,3,5, 每次都要求能整除, 到最后必定等于1
//        // 根据这个规则, 代码很简单
//
//        var uglyCount = 1
//        var ans = 1
//        while uglyCount != n {
//            ans += 1
//
//            var num = ans
//
//            while num != 1 && num % 2 == 0 {
//                num /= 2
//            }
//
//            while num != 1 && num % 3 == 0 {
//                num /= 3
//            }
//
//            while num != 1 && num % 5 == 0 {
//                num /= 5
//            }
//
//            if num == 1 {
//                uglyCount += 1
//            }
//        }
//
//        return ans
//    }
// }
