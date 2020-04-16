//
//  Solution53_2.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/13.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution53_2 {
    // 第一种解法
    func missingNumber(_ nums: [Int]) -> Int {
        // 第一个数从0开始, 每次递增匹配, 匹配不上的那个数就不在数组中
        if nums.count == 0 {
            return 0
        }
        var nextNum = 0
        for e in nums {
            if e != nextNum {
                break
            }
            nextNum = nextNum + 1
        }
        return nextNum
    }

    // 第二种高效率解法, 排好顺序的, 用二分查找!!!!
    func missingNumber2(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }

        var l = 0, r = nums.count - 1
        var mid = 0
        var ret = 0
        while l <= r {
            mid = l + (r - l) >> 1
            // 如果mid所在位置的元素刚好等于mid, 则说明mid左侧的数字都是完整的, 右侧有缺, 此时直接查找右侧
            // 如果mid所在位置元素大于mid, 说明mid的左侧数字有缺, 此时查找左侧
            if nums[mid] == mid {
                l = mid + 1
                ret = mid + 1
            } else if nums[mid] > mid {
                r = mid - 1
                ret = mid
            }
            // 不存在小于mid的情况. 所以忽略
        }

        return ret
    }
}
