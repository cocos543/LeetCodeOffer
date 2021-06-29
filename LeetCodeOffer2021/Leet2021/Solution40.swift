//
//  Solution40.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/27.
//

import Foundation

/*
 剑指 Offer 40. 最小的k个数
 输入整数数组 arr ，找出其中最小的 k 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。

 示例 1：

 输入：arr = [3,2,1], k = 2
 输出：[1,2] 或者 [2,1]
 示例 2：

 输入：arr = [0,1,2,1], k = 1
 输出：[0]

 限制：

 0 <= k <= arr.length <= 10000
 0 <= arr[i] <= 10000
 通过次数189,827提交次数333,798

 */
class Solution40 {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        if arr.count == 0 || k == 0 || k > arr.count {
            return []
        }
        var arr = arr
        _leastNumbers(&arr, 0, arr.count - 1, k)
        return Array(arr[0 ..< k])
    }

    private func _leastNumbers(_ nums: inout [Int], _ start: Int, _ end: Int, _ k: Int) {
        if start >= end {
            return
        }

        let idx = partition(&nums, start, end)
        if idx == k - 1 {
            return
        }
        if idx < k - 1 {
            _leastNumbers(&nums, idx + 1, end, k)
        } else {
            _leastNumbers(&nums, start, idx - 1, k)
        }
    }

    // 分区函数, 每次调用, 都会把第一个元素放到有序数组的最终位置
    private func partition(_ nums: inout [Int], _ start: Int, _ end: Int) -> Int {
        let p = nums[end]
        // j始终指向左区间第一个大于p的数, 后续遍历数组, 发现比p小的, 就和j交换, 然后j向后移动一格.
        var j = start
        for i in start ..< end {
            if nums[i] < p {
                let t = nums[i]
                nums[i] = nums[j]
                nums[j] = t
                j += 1
            }
        }

        let t = nums[j]
        nums[j] = p
        nums[end] = t

        return j
    }
}
