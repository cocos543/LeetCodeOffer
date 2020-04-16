//
//  Solution47.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/8.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution47 {
    func maxValue(_ grid: [[Int]]) -> Int {
        // 这是动态规划的题目, 比较难的... 不过做多了估计就懂了吧
        // 下面可以用一维数组代替二维数组... 因为状态转移之后就老的状态已经用不到了
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }

        var maxValues = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
        // 每次走完之后, 把最大值保留下来
        for row in 0 ..< grid.count {
            for col in 0 ..< grid[0].count {
                // 记录上一次的最大值(往右走的, 上一次就是左边; 往下走的, 上一次就是上面
                var left = 0, up = 0
                // row或col为0是第一次, 没有历史记录
                if row > 0 {
                    up = maxValues[row - 1][col]
                }
                if col > 0 {
                    left = maxValues[row][col - 1]
                }
                maxValues[row][col] = max(left, up) + grid[row][col]
            }
        }
        return maxValues[grid.count - 1][grid[0].count - 1]
    }
}
