//
//  Solution39.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/6.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution39 {

    func majorityElement(_ nums: [Int]) -> Int {
        // 元素排序后, 中间那个元素肯定就是目标元素
        // 这里用快排思想, 直接找到中位数即可.
        var nums = nums
        var l = 0, r = nums.count - 1
        let m = r >> 1
        var ans = 0
        while ans != m {
            ans = partition(&nums, l, r)
            if ans < m {
                l = ans + 1
            }else {
                r = ans - 1
            }
        }
        return nums[ans]
    }

    // 返回轴点元素在排序数组中的下标
    func partition(_ nums:inout [Int], _ l: Int, _ r: Int) -> Int {
        if l >= r {
            return l
        }
        var j = l
        for i in l ... r-1 {
            if nums[i] < nums[r] {
                let t = nums[i]
                nums[i] = nums[j]
                nums[j] = t
                j += 1
            }
        }
        let t = nums[r]
        nums[r] = nums[j]
        nums[j] = t
        return j
    }

    func majorityElement2(_ nums: [Int]) -> Int {
        // 这道题说一定有一个数字出现的次数, 超过数组的一半. 那么这个数在数组排序之后, 肯定覆盖数组中间位置.
        // 所以先采用快排的思想, 挑选一个数字, 作为分区数, 把小于等于这个数的元素放到他的左边, 大于这个数的元素放到他的右边,
        // 如果分区数的下标刚好在n/2, 那么这个数就肯定是超过一半的数字
        var nums = nums
        if nums.count == 0 {
            return 0
        }

        var middle = partition2(&nums, 0, nums.count - 1)
        var start = 0, end = nums.count - 1
        while middle != nums.count / 2 {
            if middle < nums.count / 2 {
                // 说明目标元素在右分区
                start = middle + 1
                middle = partition(&nums, start, end)
            }else {
                // 说明目标元素在左分区
                end = middle - 1
                middle = partition(&nums, start, end)
            }
        }
        
        // 数组已经被部分排序了, middle上的元素, 就是中位数元素
        return nums[middle]
    }

    // 返回分区数的下标
    func partition2(_ nums: inout [Int], _ start: Int, _ end: Int) -> Int {
        // 每次都选择最后一个元素作为锚点, 把所有小于锚点的数都放到左边, 并且用一个变量j指向左数第一个大于锚点的元素,
        // 这样最后锚点和j交换, 锚点就到了目标位置了
        let p = nums[end]
        var j = start
        for i in start ..< end {
            if nums[i] < p {
                let temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
                // j右边的数都是大于锚点的,所以这里直接j++, 就让j又指向左数第一个大于锚点的元素了
                j = j + 1
            }
        }

        nums[end] = nums[j]
        nums[j] = p
        
        return j
    }
}
