//
//  Solution57_2.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/16.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 面试题57 - II. 和为s的连续正数序列
 
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

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution57_2 {
    func findContinuousSequence(_ target: Int) -> [[Int]] {
        // 用两个指针, p1放在起始位置nums[1]处, p2往后移动, 每次移动一格则把对应的数字加到总数上并放入数组, 直到等于target停止, 数组个数大于2的, 加入结果列表中
        // 右边的指针继续后移一位, 得到总数sum2, 然后左边的指针后移一位, 总数就是sum2-nums[p1], 如果sum2-nums[p1] = target, 则判断是否能加入结果列表(元素至少2个)
        // 同理一直重复, 直到p1指向的元素大于target/2, 就没必要继续找了
        if target < 3 {
            return [[Int]]()
        }

        var ret = [[Int]]()
        // 实际上p1的数值就是元素的数值, 所以不需要另外创建一个数组了.
        var p1 = 1, p2 = 2
        var sum = 3
        while p1 <= target / 2 {
            if target == sum && p2 - p1 >= 1 {
                ret.append(Array(p1 ... p2))
            }
            if sum <= target {
                p2 = p2 + 1
                sum = sum + p2
            }else {
                sum = sum - p1
                p1 = p1 + 1
            }
            
        }
        
        
        return ret
    }
}
