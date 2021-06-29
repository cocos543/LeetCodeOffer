//
//  Solution57.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/17.
//

import Foundation
/*
 剑指 Offer 57. 和为s的两个数字
 输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。

  

 示例 1：

 输入：nums = [2,7,11,15], target = 9
 输出：[2,7] 或者 [7,2]
 示例 2：

 输入：nums = [10,26,30,31,47,60], target = 40
 输出：[10,30] 或者 [30,10]
  

 限制：

 1 <= nums.length <= 10^5
 1 <= nums[i] <= 10^6
 通过次数102,085提交次数154,548
 */
class Solution57 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 2 {
            return []
        }
        // 排序数组考虑二分查找, 先选中一个数字A, 之后用二分查找找到第二个数字B, 如果找不到匹配的B, 则选A修改为下一个数字, 重复逻辑
        // 其实挑选数字A只需要到数组中间即可, 如果到中间还没找到匹配的B, 那么就不会有答案了.
        var n1 = 0
        for i in 0 ..< nums.count {
            n1 = nums[i]
            let check = target - n1
            var l = 0, r = nums.count - 1
            var isFind = false
            while l <= r {
                let middle = l + (r - l) >> 1
                if nums[middle] == check {
                    isFind = true
                    break
                }else if nums[middle] < check {
                    l = middle + 1
                } else {
                    r = middle - 1
                }
            }
            if isFind {
                break
            }
        }
        
        
        return [n1, target - n1]
    }
}
