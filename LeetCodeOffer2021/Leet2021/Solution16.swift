//
//  Solution16.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/11.
//

import Foundation

/*
 剑指 Offer 16. 数值的整数次方
 实现 pow(x, n) ，即计算 x 的 n 次幂函数（即，xn）。不得使用库函数，同时不需要考虑大数问题。

  

 示例 1：

 输入：x = 2.00000, n = 10
 输出：1024.00000
 示例 2：

 输入：x = 2.10000, n = 3
 输出：9.26100
 示例 3：

 输入：x = 2.00000, n = -2
 输出：0.25000
 解释：2-2 = 1/22 = 1/4 = 0.25
  

 提示：

 -100.0 < x < 100.0
 -231 <= n <= 231-1
 -104 <= xn <= 104
  

 注意：本题与主站 50 题相同：https://leetcode-cn.com/problems/powx-n/
 */
class Solution16 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        if x > 0 && x < 0.00000001 {
            return 0
        }
                
        let ret = _pow(x, abs(n))
        
        if n < 0 {
            return 1 / ret
        }
        return ret
    }
    
    func _pow(_ x: Double, _ n: Int) -> Double {
        if n == 1 {
            return x
        }
        if n == 2 {
            return x * x
        }
        
        var ret = _pow(x, n >> 1)
        ret *= ret
        
        if n & 1 == 1 {
            return ret * x
        }
        return ret
    }
}
