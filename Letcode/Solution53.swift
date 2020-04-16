//
//  Solution53.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/12.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 面试题53 - I. 在排序数组中查找数字 I
 
 统计一个数字在排序数组中出现的次数。

  

 示例 1:

 输入: nums = [5,7,7,8,8,10], target = 8
 输出: 2
 示例 2:

 输入: nums = [5,7,7,8,8,10], target = 6
 输出: 0
  

 限制：

 0 <= 数组长度 <= 50000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution53 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // 用二分查找, 找到这个数, 返回他的下标, 然后再往左边和右边累加这个数出现的次数即可

        if nums.count == 0 {
            return 0
        }
        
        var l = 0, r = nums.count - 1
        var tIndex = 0
        while l <= r {
            let middle = l + (r - l) >> 1
            
            if nums[middle] == target {
                tIndex = middle
                break
            }
            if nums[middle] > target {
                r = middle - 1
            }else {
                l = middle + 1
            }
        }
        if nums[tIndex] != target {
            return  0
        }

        // 统计一下相同数字个数
        var count = 1
        var lIndex = tIndex - 1
        var rIndex = tIndex + 1
        while lIndex >= 0 && nums[lIndex] == target {
            count = count + 1
            lIndex = lIndex - 1
        }
        while rIndex < nums.count && nums[rIndex] == target {
            count = count + 1
            rIndex = rIndex + 1
        }

        return count
    }
}
