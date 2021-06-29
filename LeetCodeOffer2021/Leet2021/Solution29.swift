//
//  Solution29.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/18.
//

import Foundation

/*
 剑指 Offer 29. 顺时针打印矩阵
 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。

  

 示例 1：

 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 示例 2：

 输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 输出：[1,2,3,4,8,12,11,10,9,5,6,7]
  

 限制：

 0 <= matrix.length <= 100
 0 <= matrix[i].length <= 100
 注意：本题与主站 54 题相同：https://leetcode-cn.com/problems/spiral-matrix/

 通过次数110,488提交次数250,648

 */

enum Direct {
    case up
    case down
    case left
    case right
}

class Solution29 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        // 设计一个标记用来表示当前多少圈, 再设计一个方向用来表示当前的方向(左下右上)
        if matrix.count == 0 || matrix[0].count == 0 {
            return []
        }
        var ret = [Int]()
        var loop = 0
        var d = Direct.left
        var x = 0, y = 0
        
        for _ in 0 ..< matrix[0].count * matrix.count {
            ret.append(matrix[y][x])
            
            switch d {
            case .left:
                // 判断能否继续向左, 不能则向下, 如果不能向下则结束
                if x + 1 < (matrix[0].count - loop) {
                    x += 1
                } else if y + 1 < matrix.count - loop {
                    y += 1
                    d = .down
                } else {
                   break
                }
            case .down:
                // 判断能否向下, 不能则向右, 如果不能向右则结束
                if y + 1 < matrix.count - loop {
                    y += 1
                } else if x - 1 >= loop {
                    x -= 1
                    d = .right
                } else {
                    break
                }
            case .right:
                // 判断能否向右, 不能则向上, 如果不能向上则结束
                if x - 1 >= loop {
                    x -= 1
                } else if y - 1 >= loop {
                    y -= 1
                    d = .up
                } else {
                    break
                }
            case .up:
                // 判断能否向上, 不能则loop+1, 然后向左, 如果不能向左则结束
                if y - 1 >= (loop + 1) {
                    y -= 1
                } else if x + 1 < matrix[0].count - (loop + 1)  {
                    x += 1
                    d = .left
                    loop += 1
                } else {
                    break
                }
            }
        }
        
        return ret
    }
}

