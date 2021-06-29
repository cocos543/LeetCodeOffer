//
//  Solution41.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/28.
//

import Foundation
/*
 剑指 Offer 42. 连续子数组的最大和
 输入一个整型数组，数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。

 要求时间复杂度为O(n)。

 示例1:

 输入: nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。

 提示：

 1 <= arr.length <= 10^5
 -100 <= arr[i] <= 100
 注意：本题与主站 53 题相同：https://leetcode-cn.com/problems/maximum-subarray/

 通过次数149,415提交次数248,446
 */
class Solution42 {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }

        if nums.count == 1 {
            return nums[0]
        }

        var ans = Int.min
        var curNum = Int.min
        for e in nums {
            if curNum < 0 {
                // 如果当前子数组总和curNum是负数, 那么元素e是正数时, 则e就是新的子数组的第一个元素;
                // e是负数时, curNum也可以直接切换成e, 后面再让curNum和ans比较, 大于ans时赋值给ans;
                curNum = e
            } else {
                curNum += e
            }

            if ans < curNum {
                ans = curNum
            }
        }

        return ans
    }
}

// [-2,1,-3,4,-1,2,1,-5,4]
