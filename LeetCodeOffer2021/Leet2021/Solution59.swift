//
//  Solution59.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/19.
//

import Foundation
/*
 剑指 Offer 59 - I. 滑动窗口的最大值
 给定一个数组 nums 和滑动窗口的大小 k，请找出所有滑动窗口里的最大值。

 示例:

 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 输出: [3,3,5,5,6,7]
 解释:

   滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7

 提示：

 你可以假设 k 总是有效的，在输入数组不为空的情况下，1 ≤ k ≤ 输入数组的大小。

 注意：本题与主站 239 题相同：https://leetcode-cn.com/problems/sliding-window-maximum/

 通过次数108,795提交次数245,231
 */
// [9,10,9,-7,-4,-8,2,-6], 5
// [10,10,9,-4]
class Solution59 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count == 0 {
            return []
        }
        var ans = [Int]()
        
        // 把窗口元素放入队列, 窗口左边是队头
        // 队头始终记录着队列最大的数字
        // 这里有一个技巧要记住, 因为超出窗口的元素要从队列里面移除, 但是并不是所有元素都放入队列, 所以无法直接确定队头元素是否在窗口内
        // 所以使用了一个技巧, 存入队列的不是元素,而是元素所在数组下标, 这样就可以方便计算出元素是否在窗口内😂
        var deque = [Int]()
        
        for i in 0 ..< nums.count {
            if k == 1 {
                ans.append(nums[i])
            } else {
                if let first = deque.first {
                    if i - first >= k {
                        deque.removeFirst()
                    }
                }
                if let first = deque.first, var last = deque.last {
                    if nums[i] > nums[first] {
                        deque.removeAll()
                    } else {
                        // 如果最新元素大于队尾元素, 则删除队尾, 循环执行
                        while nums[i] > nums[last] {
                            deque.removeLast()
                            last = deque.last!
                        }
                    }
                }
                
                deque.append(i)
                if i >= k - 1 {
                    ans.append(nums[deque.first!])
                }
            }
        }
        
        return ans
    }
}
