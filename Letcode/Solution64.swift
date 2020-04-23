//
//  Solution6.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/23.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution64 {
    func stop(_ n: Int) -> Int {
        return 0
    }

    func sumNums(_ n: Int) -> Int {
//        // 小学公式n(n+1)/2, 但是不适合
//        // 需要用到递归, 用!!来判断递归终止, !!非0 = true, !!0 = false
//        下面代码leetcode报错了
//        let funs = [stop, sumNums]
//        var isZero = !(n as NSNumber).boolValue
//        isZero = !isZero
//        return n + funs[NSNumber(value: isZero).intValue](n - 1)  // 9 + 8 + 7 + ... + 0
        
        var ans = n
        (n > 0) && {(ans += sumNums(n-1)); return true}()
        return ans
    }
}
