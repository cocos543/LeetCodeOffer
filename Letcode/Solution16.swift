//
//  Solution16.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/30.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution16 {
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        // f(n) = f(n/2) * f(n/2) * (isOdd -> x)
        if n == 0 {
            return 1
        }
        if n == 1 {
            return x
        }

        var neg = 1
        var n = n
        if n < 0 {
            neg = -1
            n = -n
        }
        
        let isOdd = n % 2 == 1
        var ans = myPow(x, n >> 1)
        ans = ans * ans

        if isOdd {
            ans *= x
        }
        
        if neg < 0 {
            return 1 / ans
        }
        return ans
    }
    
    // 通过观察规律再解题
    func myPow2(_ x: Double, _ n: Int) -> Double {
        // 2^16, 实际上就是16个2相乘, 那么就可以看作两组, 8个2相乘, 8个2相乘. 也就是2^8 * 2^8
        // 归纳一下, 就是f(n) = f(n/2) * f(n/2)
        
        // 由于这道题里面n是整数, 所以对于奇数的n, n/2会漏掉1次方, 记得最后再把这漏掉的1次方乘回去
        if n == 0 {
            return 1
        }
        if n == 1 {
            return x
        }
        
        var negavite = false
        
        var n = n
        if n < 0 {
            negavite = true
            // 指数小于0的, 结果需要取倒数
            n = -n
        }
        
        let isOdd = n % 2 == 1
        
        var ret = myPow(x, n >> 1)
        ret = ret * ret
        if isOdd {
            ret = ret * x
        }
        
        if negavite {
            return 1 / ret
        }
        
        return ret
    }
    
    // 简单的解法会超时..
    func myPow0(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }

        var negavite = false
        var n = n
        if n < 0 {
            negavite = true
            // 指数小于0的, 结果需要取倒数
            n = -n
        }

        var ret = x
        while n > 1 {
            ret = ret * x
            n = n - 1
        }
        
        if negavite {
            return 1 / ret
        }

        return ret
    }
}
