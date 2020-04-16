//
//  Solution15.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/29.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 面试题15. 二进制中1的个数
 
 请实现一个函数，输入一个整数，输出该数二进制表示中 1 的个数。例如，把 9 表示成二进制是 1001，有 2 位是 1。因此，如果输入 9，则该函数输出 2。

 示例 1：

 输入：00000000000000000000000000001011
 输出：3
 解释：输入的二进制串 00000000000000000000000000001011 中，共有三位为 '1'。
 示例 2：

 输入：00000000000000000000000010000000
 输出：1
 解释：输入的二进制串 00000000000000000000000010000000 中，共有一位为 '1'。
 示例 3：

 输入：11111111111111111111111111111101
 输出：31
 解释：输入的二进制串 11111111111111111111111111111101 中，共有 31 位为 '1'。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-jin-zhi-zhong-1de-ge-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */
class Solution15 {
    func hammingWeight(_ n: Int) -> Int {
        // 数字直接跟1与一下, 如果为1就表示有一个1了, 再向右移一位, 继续比较, 直到数字变成0
        // 这道题如果考虑负数的话, 就不能去移动n了, 应该设置一个flag=1, 然后flag每次都向左移动去检查原数字有多少个1
        var n = n
        var count = 0
        while n > 0 {
            count = count + n & 1
            n = n >> 1
        }
        
        return count
    }
    
    // 考虑负数的解法
    func hammingWeight2(_ n: Int) -> Int {
        // 这道题如果考虑负数的话, 就不能去移动n了, 应该设置一个flag=1, 然后flag每次都向左移动去检查原数字有多少个1
        var flag = 1
        
        var count = 0
        
        while flag > 0 {
            if flag & n > 0 {
                count = count + 1
            }
            flag = flag << 1
        }
        
        // flag符号位为1时, 还需要再和n比较一次, 得到n的符号位是否为1 (符号位为1的, 表示负数, 所以小于0)
        if flag & n < 0 {
            count = count + 1
        }
        
        return count
    }
}
