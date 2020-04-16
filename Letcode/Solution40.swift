//
//  Solution40.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/6.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution40 {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        // 还是用分区函数的想来做, 当锚点的位置刚好是k时, 停止查找. 返回数组0~k的元素即可

        if k == 0 {
            return [Int]()
        }
        var arr = arr
        var start = 0, end = arr.count - 1
        var pi = partition(&arr, start, end)

        
        while pi != k - 1 {
            if pi < k - 1 {
                start = pi + 1
                pi = partition(&arr, start, end)
            }else {
                end = pi - 1
                pi = partition(&arr, start, end)
            }
        }

        return Array(arr[0 ..< k])
    }

        // 返回分区数的下标
    func partition(_ nums: inout [Int], _ start: Int, _ end: Int) -> Int {
        if start > end {
            // 如果start>end, 说明调用方失误了, 这里不需要处理
            return -1
        }
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
