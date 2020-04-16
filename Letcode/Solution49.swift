//
//  Solution49.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/9.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution49{
    func nthUglyNumber(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        // 根据丑数的定义, 从1开始, 让已有的丑数分别去乘以2,3,5, 得到的数字里面, 大于已有最大丑数的那些数当中最小的一个, 就是下一个丑数了.
        // 比如已有的丑数是1, 那么1分成乘2,3,5得到2,3,5, 那么2就是下一个丑数了.
        // 这样丑数数组就变成1,2;
        // 继续, 让1和2分别乘以2,3,5, 可以得到2,3,5,4,6,10, 这些数里面最小的一个就是2, 那么3就是下一个丑数
        // 继续, 数字变成了1,2,3, 继续上面逻辑就可以找到全部丑数了...
        // 不过上面这个逻辑很多计算是重复的
        
        var uglyArr = Array(repeating: 0, count: n)
        uglyArr[0] = 1
        // 定义三个游标, 分别表示乘2,3,5, 然后全部指向0位置
        var p2 = 0, p3 = 0, p5 = 0
        // 表示下一个丑数在数组中的位置
        var nextUglyIndex = 1
        while nextUglyIndex < n {
            let ugly = min(uglyArr[p2]*2, uglyArr[p3]*3, uglyArr[p5]*5)
            uglyArr[nextUglyIndex] = ugly
            
            // 每一个数都可以乘三个因子之中的一个, 分别是乘2,3,5, 所以同时声明了三个游标, 负责让指向的元素乘以这三个因子
            // 如果一个数乘已其中一个因子之后, 小于等于当前已经计算出来的丑数中的最大的一个, 那么这个数在后续的计算里都不需要重复乘这个因子了, 他的乘积不可能会是新的丑数,所以直接跳过.
            while uglyArr[p2]*2 <= uglyArr[nextUglyIndex] {
                p2 = p2 + 1
            }
            while uglyArr[p3]*3 <= uglyArr[nextUglyIndex] {
                p3 = p3 + 1
            }
            while uglyArr[p5]*5 <= uglyArr[nextUglyIndex] {
                p5 = p5 + 1
            }
            
            nextUglyIndex = nextUglyIndex + 1
        }
        
        return uglyArr[nextUglyIndex-1]
    }
}
