//
//  Solution39.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/25.
//

import Foundation

/*
 剑指 Offer 39. 数组中出现次数超过一半的数字
 数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 示例 1:

 输入: [1, 2, 3, 2, 2, 2, 5, 4, 2]
 输出: 2

 限制：

 1 <= 数组长度 <= 50000

 注意：本题与主站 169 题相同：https://leetcode-cn.com/problems/majority-element/

 通过次数125,593提交次数182,802
 */
class Solution39 {
    func majorityElement(_ nums: [Int]) -> Int {
        if nums.count == 1 || nums.count == 2 {
            return nums[0]
        }
        
        var nums = nums
        return _majorityElement(&nums, 0, nums.count - 1)
    }
    
    private func _majorityElement(_ nums: inout [Int], _ start: Int, _ end: Int) -> Int {
        if start == end {
            return nums[start]
        }
        
        var nums = nums
        let idx = partition(&nums, start, end)
        
        if idx == nums.count / 2 {
            return nums[idx]
        }
        
        if idx < nums.count / 2 {
            return _majorityElement(&nums, idx+1, end)
        }
        return _majorityElement(&nums, start, idx - 1)
    }

    // 分区函数, 每次调用, 都会把第一个元素放到有序数组的最终位置
    private func partition(_ nums: inout [Int], _ start: Int, _ end: Int) -> Int {
        let p = nums[end]
        // j始终指向左区间第一个大于p的数, 后续遍历数组, 发现比p小的, 就和j交换, 然后j向后移动一格.
        var j = start
        for i in start ..< end {
            if nums[i] < p {
                let t = nums[i]
                nums[i] = nums[j]
                nums[j] = t
                j += 1
            }
        }
        
        let t = nums[j]
        nums[j] = p
        nums[end] = t
        
        return j
    }
}
