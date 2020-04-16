//
//  Solution12.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/29.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*

 面试题12. 矩阵中的路径

 请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以从矩阵中的任意一格开始，每一步可以在矩阵中向左、右、上、下移动一格。如果一条路径经过了矩阵的某一格，那么该路径不能再次进入该格子。例如，在下面的3×4的矩阵中包含一条字符串“bfce”的路径（路径中的字母用加粗标出）。

 [["a","b","c","e"],
 ["s","f","c","s"],
 ["a","d","e","e"]]

 但矩阵中不包含字符串“abfb”的路径，因为字符串的第一个字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。

 示例 1：

 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 输出：true
 示例 2：

 输入：board = [["a","b"],["c","d"]], word = "abcd"
 输出：false

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ju-zhen-zhong-de-lu-jing-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */
class Solution12 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        // 这道题用回溯算法
        // 从第一行符号开始入手, 分别尝试第一行的元素, 如果等于word的第一个元素, 就继续尝试从它可能存在左右下方向挑选一个继续查找.
        // 能找到符合条件的就继续往下, 找不到就退回上一个满足的位置, 继续换一个方向查找

        
        if board.count == 0 {
            return false
        }
        
        // 减少内存开销, 直接传结构体引用即可, 不过实际上这个结构体并不会被修改...
        var board = board
        var word = Array(word)
        var visited = Array(repeating: false, count: board.count * board[0].count)

        for i in 0 ..< board.count {
            for j in 0 ..< board[i].count {
                if _find(&board, &word, i, j, 0, &visited) {
                    return true
                }
            }
        }
        return false
    }

    func _find(_ board: inout [[Character]], _ word: inout [Character], _ row: Int, _ col: Int, _ index: Int, _ visited: inout [Bool]) -> Bool {
        var find = false
        let rows = board.count, cols = board[0].count

        if board[row][col] == word[index] {
            visited[row * cols + col] = true
            if index == word.count - 1 {
                return true
            }
            // 分别从左, 右, 下, 上 查找
            // ->
            if col < cols - 1 {
                if !visited[row * cols + col + 1] {
                    find = _find(&board, &word, row, col + 1, index + 1, &visited)
                }
            }
            // <-
            if !find && col > 0 {
                if !visited[row * cols + col - 1] {
                    find = _find(&board, &word, row, col - 1, index + 1, &visited)
                }
            }
            // 向下
            if !find && row < rows - 1 {
                if !visited[(row + 1) * cols + col] {
                    find = _find(&board, &word, row + 1, col, index + 1, &visited)
                }
            }
            // 向上
            if !find && row > 0 {
                if !visited[(row - 1) * cols + col] {
                    find = _find(&board, &word, row - 1, col, index + 1, &visited)
                }
            }
        }
        
        if !find {
            visited[row * cols + col] = false
        }
        return find
    }
}
