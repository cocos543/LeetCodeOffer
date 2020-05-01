//
//  Solution04.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/17.
//  Copyright © 2020 Cocos. All rights reserved.
//

import UIKit

/*
 面试题04. 二维数组中的查找

 在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数.

 示例:

 现有矩阵 matrix 如下：

 [
   [1,   4,  7, 11, 15],
   [2,   5,  8, 12, 19],
   [3,   6,  9, 16, 22],
   [10, 13, 14, 17, 24],
   [18, 21, 23, 26, 30]
 ]
 给定 target = 5，返回 true。

 给定 target = 20，返回 false。

 限制：

 0 <= n <= 1000

 0 <= m <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-wei-shu-zu-zhong-de-cha-zhao-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */
class Solution04: NSObject {
    // 从右上角看, 比如15, 15的左边小于15, 下边大于15, 可以看成二叉搜索树, 这样搜索效率更高
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        // 从右上角出发, 元素e如果比target小, 则e等于下方元素; 比target大, 则e等于左方元素.
        if matrix.count == 0 || matrix[0].count == 0 {
            return false
        }
        var rowIdx = 0, columnIdx = matrix[0].count - 1
        while rowIdx < matrix.count && columnIdx >= 0 {
            let e = matrix[rowIdx][columnIdx]
            if e == target {
                return true
            }else if e > target {
                columnIdx -= 1
            }else {
                rowIdx += 1
            }
        }
        return false
    }
    
    // 思路一样, 从左到右, 从上到下搜索, 代码更佳直观简洁
    func findNumberIn2DArray3(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 || matrix[0].count == 0 {
            return false
        }
        
        var jstop = matrix[0].count
        for i in 0 ..< matrix.count {
            for j in 0 ..< jstop {
                if target == matrix[i][j] {
                    return true
                }
                if target < matrix[i][j] {
                    if j == 0 {
                        return false
                    }
                    jstop = j
                    break
                }
            }
        }
        return false

    }
    
    func findNumberIn2DArray2(_ matrix: [[Int]], _ target: Int) -> Bool {
        // 先找出大于targer的第一行最大的元素位置, 和第一列最大的元素位置, 之后targer只需要在这个区域以内查找即可
        
        // 判空
        if matrix.count == 0 {
            return false
        }
        
        // 这里要防止行或者列都比目标小的情况, 这样maxI或者maxJ就一直都是初始值不会改变了.
        var maxI = matrix[0].count, maxJ = matrix.count
        
        for i in 0 ..< matrix[0].count {
            if matrix[0][i] >= target {
                if matrix[0][i] == target {
                    return true;
                }
                maxI = i
            }
        }
        
        for j in 1 ..< matrix.count {
            if matrix[j][0] >= target {
                if matrix[j][0] == target {
                    return true;
                }
                maxJ = j
            }
        }
        
        // 从可能范围内查找出目标元素
        for j in stride(from: 1, to: maxJ, by: 1) {
            for i in stride(from: 1, to: maxI, by: 1) {
                if matrix[j][i] == target {
                    return true
                }
            }
        }
        
        return false
    }
}
