//
//  Solution10_2.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/5/3.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution10_2 {
    func numWays(_ n: Int) -> Int {
        let ret = [1, 1, 2]
        if n <= 2 {
            return ret[n]
        }

        // nsub1初始值表示位于第1个台阶, 所以本身跳到第1个台阶有1种跳法
        // nsub2初始值表示位于第2个台阶, 所以本身跳到第2个台阶有2种跳法
        // 思路和斐波那契数列的非递归算法一样的.仔细想一下就明白了.
        var nsub1 = 1, nsub2 = 2
        var N = 0
        for _ in stride(from: 3, through: n, by: 1) {
            N = (nsub1 + nsub2) % 1000000007
            nsub1 = nsub2
            nsub2 = N
        }

        return N
    }
}
