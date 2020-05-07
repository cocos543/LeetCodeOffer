//
//  Solution21.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/31.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution21 {
    
    func exchange(_ nums: [Int]) -> [Int] {
        // 用两个指针p1, p2指向数组开头和结尾, p1遇到偶数就停下来, p2遇到奇数停下来
        // 交换两个指针所指的数字之后, 继续重复操作, 直到p1=p2
        if nums.count <= 1 {
            return nums
        }
        var nums = nums
        var p1 = 0, p2 = nums.count-1
        while p1 <= p2 {
            if nums[p1] % 2 == 0 && nums[p2] % 2 == 1 {
                let t = nums[p1]
                nums[p1] = nums[p2]
                nums[p2] = t
                p1 += 1
                p2 -= 1
                continue
            }

            if nums[p1] % 2 == 1 {
                p1 += 1
            }
            if nums[p2] % 2 == 0 {
                p2 -= 1
            }
        }
        return nums
    }
    
    func exchange2(_ nums: [Int]) -> [Int] {
        
        if nums.count <= 1 {
            return nums
        }
        
        // 从左开始遍历, 遇到奇数跳过, 遇到偶数先标记位置, 等遇到下一个奇数时, 标记位和奇数交换, 然后继续
        var nums = nums
        var firstEvenIndex = -1
        for i in 0 ..< nums.count {
            // 遇到偶数, 标记
            if nums[i] % 2 == 0 {
                if firstEvenIndex > -1 {
                    continue
                }else {
                    firstEvenIndex = i
                }
            }else {
                // 遇到奇数, 如果已经找到偶数, 则和本轮的第一个偶数交换
                if firstEvenIndex > -1 {
                    let t = nums[firstEvenIndex]
                    nums[firstEvenIndex] = nums[i]
                    nums[i] = t
                    
                    // 标记最靠左的偶数, 用于下次交换
                    firstEvenIndex = firstEvenIndex + 1
                }
            }
        }
        
        return nums
    }
}
