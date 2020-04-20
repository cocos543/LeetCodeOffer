//
//  Solution61.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/20.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 面试题61. 扑克牌中的顺子
 从扑克牌中随机抽5张牌，判断是不是一个顺子，即这5张牌是不是连续的。2～10为数字本身，A为1，J为11，Q为12，K为13，而大、小王为 0 ，可以看成任意数字。A 不能视为 14。

  

 示例 1:

 输入: [1,2,3,4,5]
 输出: True
  

 示例 2:

 输入: [0,0,1,2,5]
 输出: True
  

 限制：

 数组长度为 5

 数组的数取值为 [0, 13] .

 通过次数7,513提交次

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/bu-ke-pai-zhong-de-shun-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution63 {
    func isStraight(_ nums: [Int]) -> Bool {
        // 先排序, 然后把0的个数取出来, 最后从第一个非0数字开始, 看成一个循环数组, 到了13后下一个位置就是1
        var nums = nums
        nums.sort()
        var zeroCount = 0
        // 已经判断为顺子的最后一张牌
        var last = 0
        var i = 0
        while i < nums.count {
            if nums[i] == 0 {
                zeroCount = zeroCount + 1
            }else {
                if last == 0 {
                    // 开始第一张非鬼的牌
                    last = nums[i]
                }else {
                    if nums[i] == last + 1 || (last == 13 && nums[i] == 1) {
                        last = last + 1
                    }else if zeroCount > 0 {
                        last = last + 1
                        // 不连续了, 用一张鬼代替
                        zeroCount = zeroCount - 1
                        continue
                    }else {
                        return false
                    }
                }
            }
            i = i + 1
        }
        return true
    }
}
