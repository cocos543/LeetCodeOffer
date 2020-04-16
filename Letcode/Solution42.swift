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
