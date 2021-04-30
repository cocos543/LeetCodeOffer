//
//  Solution12.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/29.
//

import Foundation

/*
 给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。

 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。
  
 例如，在下面的 3×4 的矩阵中包含单词 "ABCCED"（单词中的字母已标出）。

 示例 1：

 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 输出：true
 示例 2：

 输入：board = [["a","b"],["c","d"]], word = "abcd"
 输出：false
  

 提示：

 1 <= board.length <= 200
 1 <= board[i].length <= 200
 board 和 word 仅由大小写英文字母组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ju-zhen-zhong-de-lu-jing-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution12 {
    /*
     [
         ["A","B","C","E"],
         ["S","F","C","S"],
         ["A","D","E","E"]
     ]
     
     "ABCCED"
     */
    var visited: [Bool]?
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.count == 0 {
            return false
        }
        
        visited = Array(repeating: false, count: board.count * board[0].count)
        
        // 从题目看, FC这种从中间开始的字符串也符合要求, 所以每个字符串都可能是第一个, 递归需要每个字符都开始一次
        for i in 0 ..< board.count {
            for j in 0 ..< board[0].count {
                if search(board, word, j, i) {
                    return true
                }
            }
        }
        return false
    }
    
    func search(_ board: [[Character]], _ word: String, _ x: Int, _ y: Int) -> Bool {
        if y < 0 || y >= board.count {
            return false
        }
        if x < 0 || x >= board[0].count {
            return false
        }
        
        // 访问过的位置直接停止
        if visited![y * board[0].count + x] {
            return false
        }
        
        if board[y][x] != word.first {
            return false
        }
        
        if word.count == 1 {
            return true
        }
        
        // 四个方向都可能是存在合理的答案, 所以递归继续查找
        visited![y * board[0].count + x] = true
        
        let s = word[word.index(after: word.startIndex) ..< word.endIndex]
        var ret = false
        
        // 上
        ret = search(board, String(s), x, y-1)
        if ret {
            return ret
        }
        
        // 下
        ret = search(board, String(s), x, y+1)
        if ret {
            return ret
        }
        
        // 左
        ret = search(board, String(s), x - 1, y)
        if ret {
            return ret
        }
        
        // 右
        ret = search(board, String(s), x + 1, y)
        if ret {
            return ret
        }
        
        visited![y * board[0].count + x] = false
        
        return false
    }
}
