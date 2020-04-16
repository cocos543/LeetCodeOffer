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
