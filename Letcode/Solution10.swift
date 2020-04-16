//
//  Solution10.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/28.
//  Copyright © 2020 Cocos. All rights reserved.
//

/*

 写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项。斐波那契数列的定义如下：

 F(0) = 0,   F(1) = 1
 F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
 斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 1：

 输入：n = 2
 输出：1
 示例 2：

 输入：n = 5
 输出：5
 */
import Foundation

class Solution10 {
    func fib(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n == 1 {
            return 1
        }

        var nsub1 = 1, nsub2 = 0
        var N = 0
        for _ in stride(from: 2, through: n, by: 1) {
            N = (nsub1 + nsub2) % 1000000007
            nsub2 = nsub1
            nsub1 = N
        }

        return N
    }
}
