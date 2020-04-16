//
//  Solution13.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/29.
//  Copyright © 2020 Cocos. All rights reserved.
//

/*
 地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

  

 示例 1：

 输入：m = 2, n = 3, k = 1
 输出：3
 示例 1：

 输入：m = 3, n = 1, k = 0
 输出：1
 提示：

 1 <= n,m <= 100
 0 <= k <= 20

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */
import Foundation

class Solution13 {
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        // 这道题的思路和12题一模一样, 只是能否进入下一个格子的条件变成 坐标位数之和是否小于k
        // 进入某个格子a后, a标记为true, 等回溯退回上一个格子后, 不需要把a标记为false.
        // 这是因为进入这个格子之后的情况已经计算过了, 无需重复计算.
        
        // 用于记录当前访问的路径, 避免循环访问
        if m == 0 || n == 0 {
            return 0
        }
        
        var visited = Array(repeating: false, count: m * n)
        
        return _checkIn(m, n, 0, 0, k, &visited)
    }
    
    /// 返回当前格子的, 后续格子, 能进入的总数
    func _checkIn(_ m: Int, _ n: Int, _ row: Int, _ col: Int, _ k: Int, _ visited: inout [Bool]) -> Int {
        
        
        var inNum = 0
        if !visited[row * n + col] && _sum(row, col) <= k {
            
            visited[row * n + col] = true
            inNum = 1
            
            // 左
            if col < n - 1 {
                inNum = inNum + _checkIn(m, n, row, col + 1, k, &visited)
            }
            // 右
            if col > 0 {
                inNum = inNum + _checkIn(m, n, row, col - 1, k, &visited)
            }
            // 下
            if row < m - 1 {
                inNum = inNum + _checkIn(m, n, row + 1, col, k, &visited)
            }
            // 上
            if row > 0 {
                inNum = inNum + _checkIn(m, n, row - 1, col, k, &visited)
            }
        }
        
        
        return inNum
    }
    
    
    /// 判断行列位数之和
    /// - Parameters:
    ///   - row: 行号
    ///   - col: 列号
    func _sum(_ row: Int, _ col: Int) -> Int {
        var sum = 0, row = row, col = col
        while row > 0 {
            sum = sum + row % 10
            row = row / 10
        }
        
        while col > 0 {
            sum = sum + col % 10
            col = col / 10
        }
        
        return sum
    }
}
