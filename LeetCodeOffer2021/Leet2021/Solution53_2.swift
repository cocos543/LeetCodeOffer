//
//  Solution53_2.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/15.
//

import Foundation

/*剑指 Offer 53 - II. 0～n-1中缺失的数字
 一个长度为n-1的递增排序数组中的所有数字都是唯一的，并且每个数字都在范围0～n-1之内。在范围0～n-1内的n个数字中有且只有一个数字不在该数组中，请找出这个数字。

  

 示例 1:

 输入: [0,1,3]
 输出: 2
 示例 2:

 输入: [0,1,2,3,4,5,6,7,9]
 输出: 8
  

 限制：

 1 <= 数组长度 <= 10000

 通过次数128,395提交次数288,388

 */
class Solution53_2 {
    func missingNumber(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        // 如果数字齐全, 那么数组下标0的地方对应的元素是0, 10对应的就是10, 以此类推.
        // 如果中途缺了一个数字, 那么从缺的数字开始, 比如缺5, 那么下标10的位置元素就是11, 这样就知道缺的元素在10之前了, 可以用二分查找
        var left = 0, right = nums.count - 1
        var middle = 0
        while left <= right {
            middle = left + (right - left) >> 1
            if nums[middle] == middle {
                left = middle + 1
            } else {
                if middle > 0 && nums[middle - 1] == middle - 1 {
                    return middle
                } else {
                    right = middle - 1
                }
            }
        }
        
        if nums[middle] == middle {
            return middle + 1
        }
        return middle
    }
}
