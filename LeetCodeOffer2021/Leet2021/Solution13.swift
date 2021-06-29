//
//  Solution13.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/29.
//

import Foundation

/*
 剑指 Offer 13. 机器人的运动范围
 地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

 示例 1：

 输入：m = 2, n = 3, k = 1
 输出：3
 示例 2：

 输入：m = 3, n = 1, k = 0
 输出：1
 提示：

 1 <= n,m <= 100
 0 <= k <= 20
 通过次数121,443提交次数233,911

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */
class Solution13 {
    var visited: [Bool]?

    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        // 让机器人不断递归尝试所有可达区域
        // 记录每次遇到的新格子. 只有未被访问过的格子, 才能让机器人进入
        if m <= 0 || n <= 0 {
            return 0
        }

        visited = Array(repeating: false, count: n * m)

        return _moving(m, n, 0, 0, k)
    }

    private func _moving(_ m: Int, _ n: Int, _ y: Int, _ x: Int, _ k: Int) -> Int {
        // 先确保下标不要越界
        if y >= m || y < 0 {
            return 0
        }
        if x >= n || x < 0 {
            return 0
        }

        if bitSum(x, y) > k {
            return 0
        }
        
        if visited![y * n + x] {
            return 0
        }

        // 分别从上下左右探索
        visited![y * n + x] = true
        let ret = 1 + _moving(m, n, y - 1, x, k) + _moving(m, n, y + 1, x, k) + _moving(m, n, y, x - 1, k) + _moving(m, n, y, x + 1, k)
        return ret
    }

    // 计算两个数字的数位之和
    func bitSum(_ n1: Int, _ n2: Int) -> Int {
        var sum = 0
        var n1 = n1, n2 = n2
        while n1 > 0 {
            sum += n1 % 10
            n1 /= 10
        }

        while n2 > 0 {
            sum += n2 % 10
            n2 /= 10
        }
        return sum
    }
}
