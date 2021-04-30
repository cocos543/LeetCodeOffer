//
//  Solution14.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/30.
//

import Foundation

/*
 剑指 Offer 14- I. 剪绳子

 给你一根长度为 n 的绳子，请把绳子剪成整数长度的 m 段（m、n都是整数，n>1并且m>1），每段绳子的长度记为 k[0],k[1]...k[m-1] 。请问 k[0]*k[1]*...*k[m-1] 可能的最大乘积是多少？例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。

 示例 1：

 输入: 2
 输出: 1
 解释: 2 = 1 + 1, 1 × 1 = 1
 示例 2:

 输入: 10
 输出: 36
 解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36
 提示：

 2 <= n <= 58
 注意：本题与主站 343 题相同：https://leetcode-cn.com/problems/integer-break/

 通过次数110,559提交次数196,319

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/jian-sheng-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution14 {
    func cuttingRope(_ n: Int) -> Int {
        // 经典动态规划题目, 满足把大问题分解成每个最优解子问题, 而且子问题之间还有重叠, 所以可以用动态规划而不是用暴力递归
        if n < 2 {
            return 0 // 题目说m大于1, 所以最小得剪成两段, 长度小于2米的已经无法剪了
        }
        if n == 2 {
            return 1 // 1*1
        }
        if n == 3 {
            return 2 // 1*2
        }

        // 例如: 如果绳子长度大于等于4, 则可以剪成1-3,2-2,3-1, 这些子问题本身的乘积我们已经知道了(由于长度3本身是子问题, 意味着绳子已经被剪过了, 所以3无需再分解成1+2, 所以3就是最大的乘积. 同理, 2也是最大的乘积),
        // 但是不知道哪个组合才是最大的, 所以需要把每个组合的乘积都算出来然后选个最大值最为f(4)的最优解
        var optimalAnswer = Array(repeating: 0, count: n + 1)
        optimalAnswer[0] = 0
        optimalAnswer[1] = 1
        optimalAnswer[2] = 2
        optimalAnswer[3] = 3

        // 枚举出第n个问题的所有可能组合, 比如5, 有1-4,2-3,3-2,4-1, 只不过后半部分组合的成绩和前半部分一致
        for i in 4 ... n {
            // 归纳一下可以看出规律, 长度i的有效组合是i/2个
            var max = 0
            for j in 1 ... i / 2 {
                if optimalAnswer[j] * optimalAnswer[i-j] > max {
                    max = optimalAnswer[j] * optimalAnswer[i-j]
                }
            }
            optimalAnswer[i] = max
        }

        return optimalAnswer[n]
    }
    
    func cuttingRope2(_ n: Int) -> Int {
        /*
         贪婪思想, 如果每段拆出来都是最优解, 那么最终乘积肯定也是最优解
         证明过程:
         f(k): 3*(k-3); k = 5时成立(3*(5-3) = 6 > 5, 所以f(k) > k)
         f(k+1): 3*(k+1 - 3) = 3*(k-3) + 3 * 1 = f(k) + 3
         即:
         f(k+1) = f(k) + 3, 因为f(k) > k, 所以f(k+1) = f(k) + 3 > k+1
         结论:
         k>=5时, 3*(k-3) > k
         
         所以只要把从绳子里面剪出3出来, 乘积必定比原来的长度大, 这样每次都剪3, 就是最优解, 前提是绳子长度大于等于5
         */
        if n < 2 {
            return 0
        }
        if n == 2 {
            return 1
        }
        if n == 3 {
            return 2
        }
        
        if n == 4 {
            return 4
        }
        
        var time = n / 3
        var last = 1
        // 说明剪完之后还剩下1, 意味可以少剪一次, 最后保留4
        if n - (time * 3) == 1 {
            time -= 1
            last = 4
        }
        
        var ret = 1
        while time > 0 {
            ret *= 3
            time -= 1
        }
        
        return ret * last
    }
}
