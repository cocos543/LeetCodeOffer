//
//  Solution14.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/29.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation


/*
面试题14- I. 剪绳子
 
 给你一根长度为 n 的绳子，请把绳子剪成整数长度的 m 段（m、n都是整数，n>1并且m>1），每段绳子的长度记为 k[0],k[1]...k[m-1] 。请问 k[0]*k[1]*...*k[m-1] 可能的最大乘积是多少？例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。

 示例 1：

 输入: 2
 输出: 1
 解释: 2 = 1 + 1, 1 × 1 = 1
 示例 2:

 输入: 10
 输出: 36
 解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36
 提示：

 2 <= n <= 58
 */
class Solution14 {
    func cuttingRope(_ n: Int) -> Int {
        // 这道题用动态规划解决:  问题f(n)的最优解, 把绳子剪成一段长i, 一段长n-i, 拆分成子问题f(i) + f(n-i)的最优解, 问题就细化成分别解决f(i), f(n-i)
        if n == 2 {
            // 长度2, 很简单看出来只能剪成两段, 1 * 1 = 1
            return 1
        }
        
        if n == 3 {
            // 长度3, 很简单看出来剪成两段乘积最大, 2 * 1 = 2
            return 2
        }
        
        // 这个问题中多个子问题会有重叠的更小子问题, 比如 f(10)可以分成f(6), f(4); f(6)分成f(2)f(4), 可以看出f(4)也是f(6)的子问题之一
        // 所以求解的时候从下往上, 先算最小子问题, 再算更大的问题, 大问题就可以从已计算的问题中查找是否有计算过的, 如果有, 直接使用结果即可.
        
        /// 下标表示绳子长度, 所以创建出n+1个数组, 比如n=4, 这数组长度5, 最后一个元素下标是4, 符合下标表示法.
        var maxResult = Array(repeating: 0, count: n+1)
        maxResult[0] = 0 // 这个元素其实没啥用, 写上去方便理解
        maxResult[1] = 1 //长度1的段, 乘积是1
        maxResult[2] = 2 //长度2的段, 乘积是2
        maxResult[3] = 3 //长度3的段, 乘积是3
        
        var max = 0
        // 从下往上计算, 目前运行到这里, n的最小值是4, 从4开始
        // 总长度是i, 所以j的可能选择为1到i/2
        for i in 4 ... n {
            max = 0
            // 把每一种可能的切割方法的乘积都算出来, 比较找到最大的那个
            for j in 1 ... i / 2 {
                let maybeMax = maxResult[j] * maxResult[i - j]
                if maybeMax > max {
                    max = maybeMax
                }
                
                maxResult[i] = max
            }
        }
        
        // 最后差一下表里面长度n的最大乘积是多少
        max = maxResult[n]
        
        return max
    }
    
    func cuttingRope2(_ n: Int) -> Int {
        // 动态规划太难想了. 这里用贪心算法解决比较容易.
        // 如果每次都从绳子切出一段乗积最大的绳子, 那么一直切下去, 结果就是乘积最大的
        // 通过观察可以发现, 绳子等于5的时候, 切成2*3是最大的;
        // 所以对于大于5的绳子, 每次都先切3. 不够5的部分不切, 直接保留
        
        if n == 2 {
            // 长度2, 很简单看出来只能剪成两段, 1 * 1 = 1
            return 1
        }
        
        if n == 3 {
            // 长度3, 很简单看出来剪成两段乘积最大, 2 * 1 = 2
            return 2
        }
        
        var sum = 1, n = n
        while n >= 5 {
            sum = sum * 3
            n = n - 3
        }
        
        if n > 1 {
            sum = sum * n
        }
        
        return sum
    }
}
