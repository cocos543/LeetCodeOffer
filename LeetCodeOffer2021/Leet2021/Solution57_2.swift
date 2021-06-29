//
//  Solution57_2.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/18.
//

import Foundation
/*
 剑指 Offer 57 - II. 和为s的连续正数序列
 输入一个正整数 target ，输出所有和为 target 的连续正整数序列（至少含有两个数）。

 序列内的数字由小到大排列，不同序列按照首个数字从小到大排列。

  

 示例 1：

 输入：target = 9
 输出：[[2,3,4],[4,5]]
 示例 2：

 输入：target = 15
 输出：[[1,2,3,4,5],[4,5,6],[7,8]]
  

 限制：

 1 <= target <= 10^5
  

 通过次数113,125提交次数160,553
 */
class Solution57_2 {
    func findContinuousSequence(_ target: Int) -> [[Int]] {
        // 因为要求出的是连续整数序列, 而且按照首个数字大小排序, 所以只需要用两个指针AB,
        // 一开始指向第一第二个元素, 然后逐个计算相加, 和小于target的,B指针往右加入一个元素, 大于target的, A指针往右删除一个元素
        // 如果只有两个元素时还大于target即可停止
        
        var p1 = 1, p2 = 2
        var ans = [[Int]]()
        var curVal = p1 + p2
        while p1 + p2 <= target {
            if curVal < target {
                p2 += 1
                curVal += p2
            } else if curVal > target {
                curVal -= p1
                p1 += 1
            }
            
            if curVal == target {
                let arr = [Int](p1 ... p2)
                ans.append(arr)
                curVal -= p1
                p1 += 1
            }
        }
        
        return ans
    }
}
