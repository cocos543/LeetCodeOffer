//
//  Solution53.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/7.
//

import Foundation

/*
 剑指 Offer 53 - I. 在排序数组中查找数字 I
 统计一个数字在排序数组中出现的次数。

  

 示例 1:

 输入: nums = [5,7,7,8,8,10], target = 8
 输出: 2
 示例 2:

 输入: nums = [5,7,7,8,8,10], target = 6
 输出: 0
  

 限制：

 0 <= 数组长度 <= 50000

  

 注意：本题与主站 34 题相同（仅返回值不同）：https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/

 通过次数115,867提交次数218,722
 */
class Solution53 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        // 找到第一个等于目标的数字
        var middle = 0
        var left = 0, right = nums.count - 1
        while left <= right {
            middle =  left + (right-left) >> 1
            if nums[middle] < target {
                left = middle + 1
            } else if nums[middle] > target {
                right = middle - 1
            } else {
                if middle > 0 && nums[middle - 1] == target {
                    right = middle - 1
                } else {
                    break
                }
            }
        }
        
        var ans = 0
        for i in middle ..< nums.count {
            if nums[i] == target {
                ans += 1
            } else {
                break
            }
        }
        
        return ans
    }
}
