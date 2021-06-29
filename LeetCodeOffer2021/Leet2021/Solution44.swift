//
//  Solution44.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/28.
//

import Foundation
/*
 剑指 Offer 44. 数字序列中某一位的数字
 数字以0123456789101112131415…的格式序列化到一个字符序列中。在这个序列中，第5位（从下标0开始计数）是5，第13位是1，第19位是4，等等。

 请写一个函数，求任意第n位对应的数字。

  

 示例 1：

 输入：n = 3
 输出：3
 示例 2：

 输入：n = 11
 输出：0
  

 限制：

 0 <= n < 2^31
 注意：本题与主站 400 题相同：https://leetcode-cn.com/problems/nth-digit/

 通过次数40,597提交次数99,680
 */
class Solution44 {
    func findNthDigit(_ n: Int) -> Int {
        // 先计算出落到哪一个数字上
        var m = n
        var curNum = 0
        var bitLen = 1
        while m >= countOfIntegers(bitLen) * bitLen {
            m -= countOfIntegers(bitLen) * bitLen
            curNum = pow10(bitLen)
            bitLen += 1
        }
        
        // 余数
        let remain = m % bitLen
        curNum = curNum + (m / bitLen)
        if bitLen == 1 {
            return curNum
        }
        // 当前数组落在curNum的第remain位上, 比如curNum=10, remain=1, 那么命中数字0; remain=0,则命中数字1
        return bitInNum(curNum, remain, bitLen)
    }
    
    func pow10(_ n: Int) -> Int {
        var ret = 1
        for _ in 0 ..< n {
            ret *= 10
        }
        return ret
    }
    
    // 返回对应位数的数字共多少个, 2位是90个, 3位是900个, 4位9000个...
    func countOfIntegers(_ n: Int) -> Int {
        if n == 1 {
            return 10
        }
        let count = pow10(n-1)
        return 9 * count
    }
    
    // 返回数字n左数的第bit位是多少, 比如123, 第1位就是1
    func bitInNum(_ n: Int, _ bit: Int, _ bitLen: Int) -> Int {
        var m = n
        var b = bitLen - bit - 1
        
        while b > 0 {
            m = m / 10
            b -= 1
        }
        return m % 10
    }
}
