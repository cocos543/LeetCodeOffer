//
//  Solution03.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/9.
//  Copyright © 2020 Cocos. All rights reserved.
//

import UIKit
/*
 面试题03. 数组中重复的数字


 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

 示例 1：

 输入：
 [2, 3, 1, 0, 2, 5, 3]
 输出：2 或 3
  

 限制：

 2 <= n <= 100000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/// 简单的思路: 因为元素数值不会超过索引范围, 所以直接把数值作为数组下标, 在新创建的数组中, 把对应的位置的内容+1, 如果内容超过2了, 则这个元素就是答案
class Solution03: NSObject {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        // 新的思路, 假设没有数字重复, 那么数字按照顺序放置, 下标为i的位置对应的数字肯定是i
        // 现在假设元素没有重复, 那么元素i放到位置i去.
        // 不过题目说了至少有一个数字是重复的, 所以他放到位置i上, 如果i上的元素也是i, 那么i就是重复的
        // 时间复杂度n, 空间复杂度1
        var nums = nums
        for i in 0 ..< nums.count {
            // i位置的元素a, 应该被安放到下标为a的地方, 如果下标为a的地方刚好也有一个元素是a, 那么这个a就是重复的
            if nums[i] == i {
                continue
            }
            if nums[i] == nums[nums[i]] {
                return nums[i]
            }else {
                // 把i位置上的元素放到他应该放的位置去
                let ti = nums[i]
                nums[i] = nums[ti]
                nums[ti] = ti
            }
        }
        return -1
    }

    func findRepeatNumber2(_ nums: [Int]) -> Int {
        var bucket = [Int](repeating: 0, count: nums.count)
        for n in nums {
            bucket[n] = bucket[n] + 1;
            if bucket[n] >= 2 {
                return n
            }
        }
        
        return -1;
    }
}
