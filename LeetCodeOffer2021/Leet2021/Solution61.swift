//
//  Solution61.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/28.
//

import Foundation

/*
 剑指 Offer 61. 扑克牌中的顺子
 从扑克牌中随机抽5张牌，判断是不是一个顺子，即这5张牌是不是连续的。2～10为数字本身，A为1，J为11，Q为12，K为13，而大、小王为 0 ，可以看成任意数字。A 不能视为 14。

  

 示例 1:

 输入: [1,2,3,4,5]
 输出: True
  

 示例 2:

 输入: [0,0,1,2,5]
 输出: True
  

 限制：

 数组长度为 5

 数组的数取值为 [0, 13] .

 通过次数78,357提交次数170,775
 */
class Solution61 {
    func isStraight(_ nums: [Int]) -> Bool {
        // 按题目意思, 直接就是1-13个数字的顺序, 直接排序之后, 确定一下空隙有多少, 如果空隙的数量超过0的数量, 则说明不是顺子
        // 注意, 重复数组不是顺子, 顺子不一定从1开始
        let arr = nums.sorted()
        var zero = 0
        var space = 0
        var next = 0
        for e in arr {
            if e == 0 {
                zero += 1
            } else {
                if next == 0 {
                    next = e + 1
                    continue
                }
                // e比next还小, 说明e重复了
                if e < next {
                    return false
                }
                if e != next {
                    space += e - next
                }
                next = e + 1
            }
        }
        return space <= zero
    }
}
