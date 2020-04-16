//
//  Solution57.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/16.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 面试题57. 和为s的两个数字
 
 输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。

  

 示例 1：

 输入：nums = [2,7,11,15], target = 9
 输出：[2,7] 或者 [7,2]
 示例 2：

 输入：nums = [10,26,30,31,47,60], target = 40
 输出：[10,30] 或者 [30,10]
  

 限制：

 1 <= nums.length <= 10^5
 1 <= nums[i] <= 10^6

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/he-wei-sde-liang-ge-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution57 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // 用二分查找, 找到第一个小于target的数a, 假设a是两个目标数之一, 那么在这个a左边部分, 继续使用二分查找, 找到第一个小于等于target-a的数, 如果符合条件则返,
        // 不符合条件, 则继续查找a左边第一个数, 同理重复上面的步骤
        // 直到a小于target/2, 那么a左边的数再怎么加都不可能等于target了
        if nums.count < 2 {
            return [Int]()
        }

        var aIndex = binarySearch(nums, target, 0, nums.count - 1)
        if aIndex == 0 {
            return [Int]()
        }

        // a是第一个小于等于target的数字, 取a左边的数字开始比较
        //var sum = nums[aIndex]
        while aIndex > 0 {
            // 找到第一个小于等于 target - nums[aIndex]的下标
            var bIndex = binarySearch(nums, target - nums[aIndex], 0, aIndex - 1)
            while bIndex >= 0 && nums[aIndex] + nums[bIndex] >= target {
                if nums[aIndex] + nums[bIndex] == target {
                    return [nums[aIndex], nums[bIndex]]
                }
                bIndex = bIndex - 1
            }
            
            aIndex = aIndex - 1
        }
        return [Int]()
    }

    // 找到最后一个小于等于target的数字的下标
    func binarySearch(_ nums: [Int], _ target: Int, _ l: Int, _ r: Int) -> Int {
        var l = l, r = r
        while l <= r {
            let mid = l + (r-l) >> 1

            if nums[mid] > target {
                r = mid - 1
            }else if mid == r || nums[mid+1] > target {
                // 如果mid是最后一个元素, 那么mid肯定就是最后一个小于等于target的数
                // 或者min的后一个元素大于target, 那么mid也是最后一个小于等于target的数
                return mid
            }else {
                l = mid + 1
            }
        }
        return 0
    }
}
