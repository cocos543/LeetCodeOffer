//
//  Solution47.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/31.
//

import Foundation

/*
 剑指 Offer 47. 礼物的最大价值
 在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？

 示例 1:

 输入:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 输出: 12
 解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物

 提示：

 0 < grid.length <= 200
 0 < grid[0].length <= 200
 通过次数86,477提交次数125,741
 */
class Solution47 {
    func maxValue(_ grid: [[Int]]) -> Int {
        if grid.count == 0 {
            return 0
        }

        // 一个数组用来存储每一行的最佳结果, 不存储历史行, 所以只需要一个数组即可
        var state = Array<Int>(repeating: 0, count: grid[0].count)

        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                var left = 0
                var up = 0

                if i > 0 {
                    up = state[j]
                }
                if j > 0 {
                    left = state[j - 1]
                }

                if up > left {
                    state[j] = up + grid[i][j]
                } else {
                    state[j] = left + grid[i][j]
                }
            }
        }

        var max = 0
        for e in state {
            if e > max {
                max = e
            }
        }

        return max
    }
}
