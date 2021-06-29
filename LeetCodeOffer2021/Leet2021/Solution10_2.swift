//
//  Solution10_2.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/26.
//

import Foundation

/*
 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 1：

 输入：n = 2
 输出：2
 示例 2：

 输入：n = 7
 输出：21
 示例 3：

 输入：n = 0
 输出：1
 提示：

 0 <= n <= 100
 注意：本题与主站 70 题相同：https://leetcode-cn.com/problems/climbing-stairs/

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution10_2 {
    func numWays(_ n: Int) -> Int {
        // 从后往前看, 跳上第n个台阶的时候, 可能是从n-1跳上去的, 也可能是从n-2跳上去
        if n == 1 || n == 0 {
            return 1
        }
        if n == 2 {
            // 1-1; 2; 两种
            return 2
        }
        return (numWays(n-1)+numWays(n-2)) % 1000000007
    }
    
    func numWays2(_ n: Int) -> Int {
        var n1 = 1, n2 = 2
        if n == 1 || n == 0 {
            return n1
        }
        if n == 2 {
            // 1-1; 2; 两种
            return n2
        }
        
        var ret = 0
        for _ in 3 ... n {
            ret = (n1 + n2) % 1000000007
            n1 = n2
            n2 = ret
        }
        return ret
    }
}
