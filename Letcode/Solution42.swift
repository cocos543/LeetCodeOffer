//
//  Solution42.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/6.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution42 {
    
    func maxSubArray(_ nums: [Int]) -> Int {
        // 复杂度O(n), 说明只能扫一遍数组
        // 累加每个元素, 如果遇到结果是负数的, 直接丢弃负数的结果, 从下一个元素开始累加.
        // 累加过程中时时记录历史最大值(哪怕是负数也要记录)
        if nums.count == 0 {
            return -2147483648
        }
        if nums.count == 1 {
            return nums[0]
        }

        var max = -2147483648
        var curMax = -2147483648
        for e in nums {
            if curMax <= 0 {
                curMax = e
            }else {
                curMax += e
            }
            if curMax > max {
                max = curMax
            }
        }
        return max

    }



    func maxSubArray2(_ nums: [Int]) -> Int {
        // 直接一步一步走, 如果curMax是负数的话, 就直接等于下一个数字了, 因为肯定有一个数字是正数, 所以curMax等于下一个数可能就是最大值
        // 记得每次查找的时候都要记录现有的最大值
        if nums.count == 0 {
            return -2147483648
        }
        if nums.count == 1 {
            return nums[0]
        }

        var max = -2147483648
        var curMax = -2147483648
        for i in 0 ..< nums.count {
            if curMax <= 0 {
                // 计算的数组重置成从i开始
                curMax = nums[i]
            }else {
                curMax = curMax + nums[i]
            }
            
            if curMax > max {
                max = curMax
            }
        }

        return max
    }
    
    func maxSubArray2(_ nums: [Int]) -> Int {
        // 直接一步一步走, 如果curMax是负数的话, 就直接等于下一个数字了, 因为肯定有一个数字是正数, 所以curMax等于下一个数可能就是最大值
        // 记得每次查找的时候都要记录现有的最大值
        
        if nums.count == 0 {
            return Int.min
        }
        if nums.count == 1 {
            return nums[0]
        }
        
        var max = 0
        var curMax = 0
        for i in 0 ..< nums.count {
            if curMax <= 0 {
                // 计算的数组重置成从i开始
                curMax = nums[i]
            }else {
                curMax = curMax + nums[i]
            }
            
            if curMax > max {
                max = curMax
            }
        }

        return max
    }
}
