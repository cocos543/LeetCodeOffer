//
//  Solution59.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/18.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 面试题59 - I. 滑动窗口的最大值
 
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

 你可以假设 k 总是有效的，在输入数组不为空的情况下，1 ≤ k ≤ 输入数组的大小。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/hua-dong-chuang-kou-de-zui-da-zhi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution59 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        // 窗口放到起始位置, 找出最大值, 然后往右移动的时候每次都会进来一个新的数字, 判断能否成为新的最大值即可
        // 注意当前最大值可能随着窗口滑动而改变, 所以每次去除掉最左边的值之后, 如果去掉的是最大值, 则需要从窗口里面重新找到最大值, 每次遍历次数不超过k
        // 最后的时间复杂度是O(n*k)

        if nums.count == 0 {
            return [Int]()
        }
        if k == 1 {
            return nums
        }
        
        var ret = [Int]()
        var pl = 0, pr = k - 1
        var max = Int.min
        var find = true
        var nextIndex = -1
        while pr < nums.count {
            if find {
                find = false
                //首次, 先找到窗口内的最大值
                if nextIndex >= 0 {
                    max = nums[nextIndex]
                    nextIndex = -1
                }else {
                    for e in nums[pl ... pr] {
                        if e > max {
                            max = e
                        }
                    }
                }
                
            }
            ret.append(max)

            // 如果pl指向元素是max, 下一轮需要重新找到窗口内的最大值
            if nums[pl] == max {
                find = true
            }
            
            if pr + 1 < nums.count && nums[pr+1] > max {
                find = true
                nextIndex = pr + 1
            }
            
            // 需要重新查找时, 把最大值重置一下
            if find {
                max = Int.min
            }
            
            pl = pl + 1
            pr = pr + 1
        }
        return ret
    }
}
